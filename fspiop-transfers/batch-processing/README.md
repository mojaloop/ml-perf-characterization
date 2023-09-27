# FSPIOP Transfers Performance Characterization with Batch processing

_Note: Currently batch processing is implemented for only `position-prepare` messages. And there is an open PR for central-ledger [central-ledger/968](https://github.com/mojaloop/central-ledger/pull/968)._


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
- Transfers to 2-8 random DFSPs as payer and payee

## Approach
The approach taken for characterizing transfers performance with batch processing enabled is follows:
- A new Kafka topic, `topic-transfer-position-batch`, has been created to store position messages for batch processing.
- The Prepare Handler is specifically configured to publish position messages with the "prepare" action to the `topic-transfer-position-batch` Kafka topic. This selective routing ensures that only "prepare" action messages are included in the batch processing pipeline.
- A dedicated service, known as the **central-handler-position-batch**, has been introduced to process "prepare" action messages in batches. This service consumes messages from the `topic-transfer-position-batch` Kafka topic and processes them as batches, optimizing performance for this specific action type.
- Messages with actions other than "prepare" (e.g., "fulfil", "abort", "timeout" etc.) continue to be consumed and processed individually. This approach segregates processing pipelines based on action types, applying batch processing selectively.
- Used monitoring services for metrics

Refer to the following diagram showing the interaction diagram:
![profiling-position-handler-in-isolation](assets/images/Transfers-Arch-End-to-End-v1.1-batch-prepare-position.drawio.svg)

## Steps followed
- Build the Central Ledger Docker image from the branch [feat/prepare-handler-publish-topic](https://github.com/mojaloop/central-ledger/tree/feat/prepare-handler-publish-topic) of the central-ledger repository. Tag the image with `mojaloop/central-ledger:local`.
  
  **Reasoning:**
  - This step is necessary because there was an issue identified with Kafka consumption in the prepare handler when using the latest version of Central Ledger (v17.2.0). Version v17.0.3 is known to work correctly. A story is created mojaloop/3529.
  - To address this issue temporarily, some functionality has been backported to the older version, i.e., v17.0.3, in the branch `central-ledger:feat/prepare-handler-publish-topic`.
- Clone the repository [mojaloop/ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness.git).
- Uncomment the line `CLEDG_KAFKA__EVENT_TYPE_ACTION_TOPIC_MAP__POSITION__PREPARE` in the `perf.env` file.
- Adjust the replica count by modifying the `CENTRAL_LEDGER_POSITION_BATCH_REPLICAS` to the desired number.
- Update the version of `CENTRAL_LEDGER_VERSION` to `local`.
- Follow the instructions outlined in the README file to initiate the performance stack with monitoring capabilities.
- Execute a k6 transfer test case as specified in the README.
- Observe the performance metrics in the Grafana dashboard to evaluate the system's behavior and performance.

## Test Scenarios

| Scenario           | Cache    | DFSPs   | batchSize | Consumer Timeout | Scale   | Other Services Scale | Vus   | Throughput   | Latency  |
|--------------------|----------|---------|-----------|------------------|---------|----------------------|-------|--------------|----------|
| Non Batching - S1  | Enabled  | 8       | -         | -                | 1       | All: 1               | 30    | 103 ops/s    | 298ms    |
| Batching - S2      | Enabled  | 8       | 50        | 10ms             | 1       | All: 1               | 30    | 119 ops/s    | 260ms    |
| Batching - S3      | Enabled  | 8       | 50        | 10ms             | 1       | All: 2               | 30    | 135 ops/s    | 232ms    |
| Batching - S4      | Enabled  | 8       | 50        | 10ms             | 1       | All: 2               | 50    | 173 ops/s    | 316ms    |
| Batching - S5      | Enabled  | 8       | 50        | 10ms             | 1       | All: 2               | 70    | 198 ops/s    | 362ms    |
| Batching - S6      | Enabled  | 8       | 50        | 10ms             | 1       | All: 2               | 100   | 226 ops/s    | 456ms    |
| Batching - S7      | Enabled  | 8       | 50        | 10ms             | 1       | CL: 4, All: 2        | 30    | 140 ops/s    | 237ms    |
| Batching - S8      | Enabled  | 8       | 50        | 10ms             | 1       | CL: 4, All: 2        | 100   | 233 ops/s    | 453ms    |
| Batching - S9      | Enabled  | 8       | 50        | 10ms             | 8       | CL POS: 8, All: 4    | 30    | 201 ops/s    | 155ms    |
| Batching - S10     | Enabled  | 8       | 50        | 10ms             | 8       | CL POS: 8, All: 4    | 100   | 282 ops/s    | 393ms    |


### Observations

1. **Increased Efficiency in Position-Prepare Handling:** Significant improvements have been observed in the processing of position-prepare messages, thanks to the utilization of Kafka lag monitoring for the `topic-transfer-position-batch`. Notably, the lag on this topic has been minimized to a very low level.

2. **Kafka Lag Identification:** Extensive Kafka lag has been identified across several critical topics:
    - `topic-transfer-position`: Pertaining to fulfillment of position messages.
    - `topic-transfer-prepare`: Associated with the preparation phase of transfers.
    - `topic-transfer-fulfil`: Corresponding to the fulfillment of transfers.

3. **Optimized Throughput Achieved:** The system achieved an impressive throughput of 280 operations per second (ops/sec) by fully utilizing the CPU. This was accomplished by deploying 100 k6 virtual users (VUs), with the CPU utilization peaking at 99% under this load.

4. **Upcoming Hardware Upgrade:** To establish a precise benchmark and further enhance performance, testing with new hardware featuring increased CPU capacity is planned.
