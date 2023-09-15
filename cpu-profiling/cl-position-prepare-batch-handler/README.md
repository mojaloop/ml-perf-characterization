# Profile the Central-Ledger Position Handler with Batch support in isolation

## Status

| Central Ledger Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|


## Testing Environment
- Hardware specification and Software versions
  ```
  CPU: TBD
  Memory: TBD
  OS: TBD
  Docker: TBD
  Mysql: docker:mysql/mysql-server:8.0.32
  Kafka: docker:bitnami/kafka:3.5.0
  Node: v18.17.1
  Central Ledger: Branch - feature/position-prepare-binnning
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

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Expose port `3306` of mysql service
- Add new partition `topic-transfer-position-batch` to kafka-provisioning
- Start the docker services for dependencies
  ```
  docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test up -d kafka-provisioning kafka mysql-cl
  ```
- Download central-ledger repository
- Add this config to `default.json` -> `KAFKA.CONSUMER.POSITION.config.rdkafkaConf[partition.assignment.strategy]: cooperative-sticky`
- Start **position handler** using the following
  ```
  npm run migrate
  env "CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE=topic-transfer-position-batch" node src/handlers/index.js handler --positionbatch
  ```
- Add the new target `<Docker IP of Host>:3001` (ex: 172.17.0.1:3001) to `prometheus.yml`
- Start monitoring services using the following command
  ```
  docker compose --project-name monitoring --profile transfers-test -f docker-compose-monitoring.yml up -d
  ```

## Triggering position messages

- Execute the following script for the messages `action=prepare`
  ```
  sh ./feed-test-data-position-prepare-batch.sh
  ```
- Now you should see the activity in position handler service
- Observe the grafana dashboard `mojaloop-central-ledger` for **Processed requests per second** and **Processing Time**

