# Profile the Central-Ledger Position Handler with Batch support in isolation

## Status

| Central Ledger Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|


## Testing Environment
- Hardware specification and Software versions
  ```
  CPU: AMD Ryzen 9 3900X 12-Core Processor
  Memory: 32GB
  OS: Ubuntu 23.04 linux/amd64
  Docker: v24.0.5
  Mysql: docker:mysql/mysql-server:8.0.32
  Kafka: docker:bitnami/kafka:3.4.0
  Node: v16.15.0
  Central Ledger: v17.0.3
  ```
- Used In-Memory MySQL DB for all the scenarios to rule out disk I/O issues
- Transfers to 2 random DFSPs as payer and payee

## Approach
The approach taken for profiling central ledger in isolation is follows:
- Deployed MySQL and Kafka services as dependencies
- Used the same 5000 messages captured as part of performance characterization of position handler
- Used previously captured MySQL database dump to set the tables state before position handler starts to process the messages
- Replay the MySQL state and kafka messages and observe the running instance of position handler
- Used monitoring services for metrics

Refer to the following diagram showing the interaction diagram:

## Test Position Handler using kcat
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Expose port `3306` of mysql service
- Add new partition `topic-transfer-position-batch` to kafka-provisioning
- Start the docker services for dependencies
  ```
  docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test up -d kafka-provisioning kafka mysql-cl
  ```
- Download central-ledger repository
- Enable cache (CACHE.CACHE_ENABLED: true) in default.json
- Start **position handler** using the following
  ```
  npm run migrate
  nohup env "CLEDG_PORT=3001" "CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE=topic-transfer-position-batch" node src/handlers/index.js handler --positionbatch > /dev/null 2>&1&
  ```
  Note: Running the service with nohup is important otherwise we will get very low throughput
- Add the new target `<Docker IP of Host>:3001` (ex: 172.17.0.1:3001) to `prometheus.yml`
- Start monitoring services using the following command
  ```
  docker compose --project-name monitoring --profile transfers-test -f docker-compose-monitoring.yml up -d
  ```

- Execute the following script for the messages `action=prepare`
  ```
  sh ./feed-test-data-position-prepare-batch.sh
  ```
- Now you should see the activity in position handler service
- Observe the grafana dashboard `mojaloop-central-ledger` for **Processed requests per second** and **Processing Time**

## Test Position Handler using K6 load
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Add new partition `topic-transfer-position-batch` to kafka-provisioning
- Add the following line to perf.env
```
CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE=topic-transfer-position-batch
```
- Start the docker services
```
env "CENTRAL_LEDGER_VERSION=v17.2.0" docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile ttk-provisioning-transfers up -d --scale ml-handler-notification=0 --scale central-handler-prepare=4 --scale central-ledger=1 --scale ml-api-adapter=1 --scale central-handler-position=0 --scale central-handler-fulfil=0
```
- After all the service are healthy, check if the provisioning collection is passed. If it fails execute it again using the following command
```
docker restart ttk-provisioning-transfers
```
- Change `iterations` count to '500000'
- Start transfer(no callback) test case
```
env K6_SCRIPT_CONFIG_FILE_NAME=fspiopTransfersNoCallback.json docker compose --project-name load -f docker-compose-load.yml up
```
- Wait for prepare handlers to process all the messages in prepare queue
- Start the position handler
- Stop all services
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test down
```

## Capturing Kafka and MySQL dumps for position-prepare
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Expose port `3306` of kafka service
- Chnage central ledger version to `v17.2.0` in .env file (CENTRAL_LEDGER_VERSION=v17.2.0)
- Run the services except position handler
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile ttk-provisioning-transfers up -d --scale central-handler-position=0
```
- Wait for the TTK provisioning to be completed
- `Note: We need to start with fresh deployment as we don't want to dump old data`
- Change interation count in `fspiopTransfersNoCallback.json` to `500000` ("iterations": 500000)
- Set the pool to 8 dfsps in perf.env file (K6_SCRIPT_FSPIOP_FSP_POOL)
- Execute k6 load scenario `postTransfersNoCallback
```
env K6_SCRIPT_CONFIG_FILE_NAME=fspiopTransfersNoCallback.json docker compose --project-name load -f docker-compose-load.yml up
```
- Allow some time to get all messages processed by other handlers
- Dump mysql database `central_ledger` using `mysqldump` command and store it in a file
```
docker exec -it mysql-cl /bin/mysqldump central_ledger > cl-position-handler-testing-prepare.sql
```
- Dump kafka message in the topic `topic-transfer-position` using the following command
```
docker run -i --log-driver=none -a stdin -a stdout -a stderr --network=host edenhill/kcat:1.7.1 -b localhost:9092 -t topic-transfer-position-batch -C -K\| > kafka-topic-transfer-position-prepare.dump
```
- Compress the files
```
tar -cvzf position-prepare-5l-8dfsps.tar.gz cl-position-handler-testing-prepare.sql kafka-topic-transfer-position-prepare.dump
```

## Test Scenarios

### With one instance

| Scenario           | Cache    | DFSPs   | batchSize | Scale   | Throughput   | Latency  |
|--------------------|----------|---------|-----------|---------|--------------|----------|
| Non Batching - S0  | Enabled  | 2       | -         | 1       | 183 ops/s    | 5.37ms   |
| Non Batching - S1  | Disabled | 2       | -         | 1       | 161 ops/s    | 6.44ms   |
| Batching - S2      | Enabled  | 2       | 10        | 1       | 1.10K ops/s  | 8.39ms   |
| Batching - S3      | Disabled | 2       | 10        | 1       | 907 ops/s    | 9.97ms   |
| Batching - S4      | Enabled  | 2       | 50        | 1       | 1.95K ops/s  | 21.5ms   |
| Batching - S5      | Enabled  | 2       | 100       | 1       | 2.22K ops/s  | 36.3ms   |
| Batching - S6      | Enabled  | 4       | 10        | 1       | 762 ops/s    | 12.1ms   |
| Batching - S7      | Enabled  | 4       | 20        | 1       | 1.17K ops/s  | 15.4ms   |
| Batching - S8      | Enabled  | 4       | 40        | 1       | 1.55K ops/s  | 21.9ms   |
| Batching - S9      | Enabled  | 4       | 50        | 1       | 1.67K ops/s  | 25.8ms   |
| Batching - S10     | Enabled  | 4       | 100       | 1       | 1.94K ops/s  | 42.8ms   |
| Batching - S11     | Enabled  | 8       | 10        | 1       | 779 ops/s    | 11.0ms   |
| Batching - S12     | Enabled  | 8       | 20        | 1       | 1.18K ops/s  | 26.1ms   |
| Batching - S13     | Enabled  | 8       | 40        | 1       | 1.68K ops/s  | 20.9ms   |
| Batching - S14     | Enabled  | 8       | 50        | 1       | 1.84K ops/s  | 23.0ms   |
| Batching - S15     | Enabled  | 8       | 100       | 1       | 2.15K ops/s  | 38.6ms   |

### With scaling and distributed messages based on accountID across kafka partitions

| Scenario           | Cache    | DFSPs   | batchSize | Scale   | Throughput per instance | Overall throughput  | Latency  |
|--------------------|----------|---------|-----------|---------|-------------------------|---------------------|----------|
| Batching - S16     | Enabled  | 2       | 50        | 1       | 1.88K ops/s             | 1.88K ops/s         | 21.4ms   |
| Batching - S17     | Enabled  | 4       | 50        | 1       | 1.54K ops/s             | 1.54K ops/s         | 27.5ms   |
| Batching - S18     | Enabled  | 8       | 50        | 1       | 1.63K ops/s             | 1.63K ops/s         | 25.5ms   |
| Batching - S19     | Enabled  | 2       | 50        | 2       | TBD ops/s               | TBD ops/s           | TBDms    |
| Batching - S20     | Enabled  | 4       | 50        | 2       | TBD ops/s               | TBD ops/s           | TBDms    |
| Batching - S21     | Enabled  | 8       | 50        | 2       | TBD ops/s               | TBD ops/s           | TBDms    |
| Batching - S22     | Enabled  | 4       | 50        | 4       | TBD ops/s               | TBD ops/s           | TBDms    |
| Batching - S23     | Enabled  | 8       | 50        | 4       | TBD ops/s               | TBD ops/s           | TBDms    |
| Batching - S24     | Enabled  | 8       | 50        | 8       | TBD ops/s               | TBD ops/s           | TBDms    |
