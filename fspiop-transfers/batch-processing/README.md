# FSPIOP Transfers Performance Characterization with Batch processing

_Note: Currently batch processing is implemented for only `position-prepare` messages._


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

## Test Scenarios

| Scenario           | Cache    | DFSPs   | batchSize | Scale   | Throughput   | Latency  |
|--------------------|----------|---------|-----------|---------|--------------|----------|
| Batching - S1      | Enabled  | 2       | 10        | 1       | TBD ops/s    | TBDms    |
| Batching - S2      | Enabled  | 4       | 10        | 1       | TBD ops/s    | TBDms    |
| Batching - S3      | Enabled  | 8       | 10        | 1       | TBD ops/s    | TBDms    |
| Batching - S4      | Enabled  | 2       | 50        | 1       | TBD ops/s    | TBDms    |
| Batching - S5      | Enabled  | 4       | 50        | 1       | TBD ops/s    | TBDms    |
| Batching - S6      | Enabled  | 8       | 50        | 1       | TBD ops/s    | TBDms    |
| Batching - S7      | Enabled  | 2       | 100       | 1       | TBD ops/s    | TBDms    |
| Batching - S8      | Enabled  | 4       | 100       | 1       | TBD ops/s    | TBDms    |
| Batching - S9      | Enabled  | 8       | 100       | 1       | TBD ops/s    | TBDms    |


### Observations
- TBD