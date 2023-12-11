# Profile the Central-Ledger Position (Commit) Handler with Batch support in isolation

## Status

| Central Ledger Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|


## Testing Environment
- The following AWS machine was used for testing: `m6i.4xlarge`
  - `16x` vCPU - `3.5 GHz` 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - `64gb` RAM
  - HDD `io2` with `50`-`100` GB, @ `5k` iOP/S
  - Docker: 20.10.23
  - Mysql: docker:mysql/mysql-server:8.0.32
  - Kafka: docker:bitnami/kafka:3.5.0
- Used In-Memory MySQL DB for all the scenarios to rule out disk I/O issues
- Transfers to 8 random DFSPs as payer and payee

## Approach
The approach taken for profiling central ledger in isolation is follows:
- Deployed MySQL and Kafka services as dependencies
- Captured 5L position-commit messages and MySQL data dump to set the tables state before position handler starts to process the messages
- Replay the MySQL state and kafka messages and observe the running instance of position handler
- Used monitoring services for metrics

Refer to the following diagram showing the interaction diagram:
![profiling-position-handler-in-isolation](assets/images/profiling-position-handler-in-isolation.drawio.png)

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
  nohup env "CLEDG_PORT=3001" "CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE=topic-transfer-position-batch" "CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__COMMIT=topic-transfer-position-batch" node src/handlers/index.js handler --positionbatch > /dev/null 2>&1&
  ```
  Note: Running the service with nohup is important otherwise we will get very low throughput
- Add the new target `<Docker IP of Host>:3001` (ex: 172.17.0.1:3001) to `prometheus.yml`
- Start monitoring services using the following command
  ```
  docker compose --project-name monitoring --profile transfers-test -f docker-compose-monitoring.yml up -d
  ```
- Execute the following script for the messages `action=commit` from `cpu-profiling/cl-position-fulfil-batch-handler/test-data/feed-test-data-position-commit-batch.sh` of [ml-perf-characterization](https://github.com/mojaloop/ml-perf-characterization.git) repository.
  ```
  sh ./feed-test-data-position-commit-batch.sh
  ```
- Now you should see the activity in position handler service
- Observe the grafana dashboard `mojaloop-central-ledger` for **Processed requests per second** and **Processing Time**

## Test Position Handler running as docker processes
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Expose port `3306` of mysql service
- Change `CENTRAL_LEDGER_POSITION_BATCH_REPLICAS` to desired number
- Enable the following line in perf.env
```
CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE=topic-transfer-position-batch
CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__COMMIT=topic-transfer-position-batch"
```
- Start the docker services for position batch handler
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test up -d kafka-provisioning kafka mysql-cl central-handler-position-batch
```
- Wait for all the services become healthy
- Start monitoring services using the following command
  ```
  docker compose --project-name monitoring --profile transfers-test -f docker-compose-monitoring.yml up -d
  ```
- Execute the following script for the messages `action=commit` from `cpu-profiling/cl-position-fulfil-batch-handler/test-data/feed-test-data-position-commit-batch.sh` of [ml-perf-characterization](https://github.com/mojaloop/ml-perf-characterization.git) repository
  ```
  sh ./feed-test-data-position-commit-batch.sh
  ```
- Now you should see the activity in position batch handler instances
- Observe the grafana dashboard `mojaloop-central-ledger` for **Processed requests per second** and **Processing Time**

## Capturing Kafka and MySQL dumps for position-commit
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Expose port `3306` of mysql service
- Change central ledger version to `v17.5.0-snapshot.0` in .env file (CENTRAL_LEDGER_VERSION=v17.5.0-snapshot.0)
- Change `CENTRAL_LEDGER_POSITION_BATCH_REPLICAS` to desired number
- Set commit override to unused topic and add unused topic name to kafka-provisioning script

This should dump 5l messages into the unused topic that we can dump
```
CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__COMMIT=topic-transfer-position-batch-1"
```
```
kafka-topics.sh --bootstrap-server kafka:29092 --create --if-not-exists --topic topic-transfer-position-batch-1 --replication-factor 1 --partitions $$KAFKA_POSITION_BATCH_PARTITIONS_NUM
```
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile ttk-provisioning-transfers up -d
```
- Wait for the TTK provisioning to be completed
- `Note: We need to start with fresh deployment as we don't want to dump old data`
- Change iteration count in `fspiopTransfersNoCallback.json` to `500000` ("iterations": 500000)
- Set the pool to 8 dfsps in perf.env file (K6_SCRIPT_FSPIOP_FSP_POOL)
- Execute k6 load scenario `postTransfersNoCallback`
```
env K6_SCRIPT_CONFIG_FILE_NAME=fspiopTransfersNoCallback.json docker compose --project-name load -f docker-compose-load.yml up
```
- Allow some time to get all messages processed by other handlers
- Dump mysql database `central_ledger` using `mysqldump` command and store it in a file
```
docker exec -it mysql-cl /bin/mysqldump central_ledger > cl-position-handler-testing-commit.sql
```
- Dump kafka message in the topic `topic-transfer-position` using the following command
```
docker run -i --log-driver=none -a stdin -a stdout -a stderr --network=host edenhill/kcat:1.7.1 -b localhost:9092 -t topic-transfer-position-batch-1 -C -K\| > kafka-topic-transfer-position-commit.dump
```
- Compress the files
```
tar -cvzf position-commit-5l-8dfsps.tar.gz cl-position-handler-testing-commit.sql kafka-topic-transfer-position-commit.dump
```

## Test Scenarios

### With one instance

| Scenario           | Cache    | DFSPs   | batchSize | Scale   | Throughput   | Latency  |
|--------------------|----------|---------|-----------|---------|--------------|----------|
| Non Batching - S0  | Enabled  | 8       | -         | 1       |     |    |
| Batching - S1     | Enabled  | 8       | 10        | 1       |     |    |
| Batching - S2     | Enabled  | 8       | 20        | 1       |   |    |
| Batching - S3     | Enabled  | 8       | 40        | 1       |   |    |
| Batching - S4     | Enabled  | 8       | 50        | 1       |   |    |
| Batching - S5     | Enabled  | 8       | 100       | 1       |   |    |
| Batching - S6     | Enabled  | 8       | 1         | 1       |     |    |

### With scaling and distributed messages based on accountID across kafka partitions

| Scenario           | Cache    | DFSPs   | batchSize | Scale   | Throughput per instance | Latency  |
|--------------------|----------|---------|-----------|---------|-------------------------|----------|
| Batching - S8     | Enabled  | 8       | 50        | 2       |              |    |


### Observations

