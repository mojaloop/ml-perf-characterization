# FSPIOP Transfers Performance Characterization (PLACEHOLDER)

## Status

| Mojaloop Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|
| 15.1.0 |   |   | See [#follow-up-stores](#follow-up-stories) |   |
|   |   |   |   |   |

## Test Cases

Test Case | Description | K6 Test Case | Notes
---------|---------|----------|---------|---------|
 1 | FSPIOP Transfers End-to-end | Transfers | FSPIOP POST /transfers request executed from K6 |

## Test Scenarios

### Assumptions

- Use In-Memory DB for all the scenarios to rule out disk I/O issues
- Disable cl-timeout handler
- Disable cl-get handler
- Default is random 2 DFSPs as payer and payee from the configurable pool
- No PATCH CALLBACKS and No PAYEE NOTIFICATION (Env Var: `MLAPI_TRANSFERS__SEND_TRANSFER_CONFIRMATION_TO_PAYEE=false`)

### Scenarios

Scenario | Description | Test-Case | Repeatable (Y/N) | K6 Test Scenario / Config | Notes
---------|----------|---------|---------|---------|---------
 1 | FSPIOP Transfers POST /transfers with Sims-only + Unidirectional - scale:1, k6vu:1 | 1 | Y | fspiopTransfers | .
 2 | FSPIOP Transfers POST /transfers with Sims-only + Unidirectional - scale:1, k6vu:MAX | 1 | Y | fspiopTransfers | .
 3 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:1, k6vu:1 | 1 | Y | fspiopTransfers | .
 4 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:1, k6vu:MAX | 1 | Y | fspiopTransfers | .
 5 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:1~~ | 1 | Y | fspiopTransfers | .
 6 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX | 1 | Y | fspiopTransfers | .
 7 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL + Unidirectional - scale:2, k6vu:1~~ | 1 | Y | fspiopTransfers | .
 8 | FSPIOP Transfers POST /transfers with MLAPI & CL + Unidirectional - scale:2, k6vu:MAX | 1 | Y | fspiopTransfers | .
 9 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:1, dfsps:4 | 1 | Y | fspiopTransfers~~ | .
 10 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX, dfsps:4 | 1 | Y | fspiopTransfers | .
 11 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX, dfsps:8 | 1 | Y | fspiopTransfers | .
 12 | FSPIOP Transfers POST /transfers with MLAPI & CL with cache config enabled - scale:1, k6vu:1 | 1 | Y | fspiopTransfers | .
 13 | FSPIOP Transfers POST /transfers with MLAPI & CL with cache config enabled - scale:1, k6vu:MAX | 1 | Y | fspiopTransfers | .
 14 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api - scale:1, k6vu:1~~ | 1 | Y | fspiopTransfers | .
 15 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api - scale:2, k6vu:MAX~~ | 1 | Y | fspiopTransfers | .
 16 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api + No Logs/Event-Audits - scale:1, k6vu:MAX~~ | 1 | Y | fspiopTransfers | .
 17 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api + UV_THREADPOOL_SCALE:24 - scale:1, k6vu:MAX~~ | 1 | Y | fspiopTransfers | .
 18 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api + No Logs/Event-Audits + UV_THREADPOOL_SCALE:24 - scale:1, k6vu:MAX~~ | 1 | Y | fspiopTransfers | .
 19 | ~~FSPIOP Transfers POST /transfers with MLAPI & CL with mocked central-admin-api + No Logs/Event-Audits + UV_THREADPOOL_SCALE:24 - scale:1, k6vu:MAX~~ | 1 | Y | fspiopTransfers | .
 20 | FSPIOP Transfers POST /transfers with MLAPI & CL + Timeout handler - scale:1, k6vu:1 | 1 | Y | fspiopTransfers | .
 21 | FSPIOP Transfers POST /transfers with MLAPI & CL + Timeout handler - scale:1, k6vu:MAX | 1 | Y | fspiopTransfers | .
 22 | FSPIOP Transfers POST /transfers with MLAPI & CL + Timeout handler - scale:2-4, k6vu:1 | 1 | Y | fspiopTransfers | .
 23 | FSPIOP Transfers POST /transfers with MLAPI & CL + Timeout handler - scale:2-4, k6vu:MAX | 1 | Y | fspiopTransfers | .
 24 | FSPIOP Transfers POST /transfers with MLAPI & CL + PAYEE NOTIFICATION - scale:2, k6vu:MAX | 1 | Y | fspiopTransfers | .
 25 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2+4position+4notification, k6vu:MAX, dfsps:8, partitions: 17  | 1 | Y | fspiopTransfers | .
 26 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2+8position+4notification, k6vu:MAX, dfsps:8, partitions: 17  | 1 | Y | fspiopTransfers | .
 27 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2+4position+4notification, k6vu:MAX, dfsps:4, partitions: 17, diskSize:100gb | 1 | Y | fspiopTransfers | .
 28 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2+4position+4notification, k6vu:MAX, dfsps:8, partitions: 17, diskSize:100gb | 1 | Y | fspiopTransfers | .
 29 | FSPIOP Transfers POST /transfers with MLAPI & CL - scale:4+8position+4notification, k6vu:16, dfsps:8, partitions: 17,  diskSize:100gb | 1 | Y | fspiopTransfers | .
 30 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache - scale:2, dfsps:8, partitions: 17, k6vu:MAX | 1 | Y | fspiopTransfers | .
 31 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:12 | 1 | Y | fspiopTransfers | .
 32 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache - scale:4+8position+4notification, dfsps:4, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers | .
 33 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache - scale:4+8position+4notification, dfsps:8, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers | .
 34 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off env var - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers
 35 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16| 1 | Y | fspiopTransfers
 36 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging off - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16| 1 | Y | fspiopTransfers
 37 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging off + audit logs off - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers
 38 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging off + audit logs off + UV_THREADPOOL_SCALE:24 - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers
 39 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16 | 1 | Y | fspiopTransfers
 40 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:20 | 1 | Y | fspiopTransfers
 41 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:20 | 1 | Y | fspiopTransfers
 42 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:30 | 1 | Y | fspiopTransfers
 43 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix + mocked central admin api - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:30 | 1 | Y | fspiopTransfers
 44 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix + reduced IOPS - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:20 | 1 | Y | fspiopTransfers
 45 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix + reduced IOPS + bin_log off - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:20 | 1 | Y | fspiopTransfers
 46 | FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off + logging on + audit logs on + UV_THREADPOOL_SCALE:24 + ML notification stringify fix + reduced IOPS + bin_log off - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:30 | 1 | Y | fspiopTransfers

<!--
 1 | ... | # | Y/N | . | .
 2 | ... | # | Y/N | . | .
 3 | ... | # | Y/N | . | .
-->

### Approach

The approach taken for characterization is follows:

#### 0. Tools Used

Refer to [../README.md#4-tools-used](../README.md#4-tools-used) for more information.

#### 1. Setup Tests, Test-Scenarios & ml-core-test-harness

TBD

#### 2. Capturing End-to-end Metrics

Refer to [../README#capturing-end-to-end-metrics](../README.md#2-capturing-end-to-end-metrics) for more information.

#### 2. Validate Tests, Test-Scenarios & ml-core-test-harness

Once this has been established the next step is to validate the ml-core-test-harness, and the [Test Cases](#test-cases) by executing a [Smoke test](../README.md#3-types-of-tests).

#### 3. Baseline without the Target Service

TBD

#### 4. Execute a Tests with the Target Service based on Test Scenarios

This stage we execute the actual Test Scenarios, capture results, and document any observations and findings as a results.

Here we would execute any combination of the following tests based on the [Test Scenarios](#test-scenarios):

1. Average-Load
2. Stress
3. Spike
4. Breakpoint

## Follow-up stories

| Story | Name | Description | Impact | Issue | Notes |
|---|---|---|---|---|---|
| 1 | Optimize MySQL IO | Central-Ledger indicates that we are heavily bound by MySQL IO, investigating potential solutions to reduce this dependency would drastically improve performance. | High | Potential solutions include: PRISM (propagate data in messages), Simplify & Merge SQL statements, Cache SQL Queries, etc |
| 2 | Optimize Stream Lib | Investigate how to optimize Kafka Streaming lib, and add [metrics instrumentation](https://github.com/Collaborne/node-rdkafka-prometheus). | Medium-High |   | Potential solutions include: serialization using Protobuf, and monitor local msg queue vs kafka queue to determine if lag is by the NodeJS vs Node-Rdkafka process |
| 3 | Optimize Msg Processing via Batch | Investigate impact of processing messages in batches. | Medium-High |   | Potential solutions include: optimizing SQL statements due to batching nature. |
| 4 | Profile Position Handler in isolation | Profile Central-Ledger Position Handler as its one of the components showing the usage of resources (i.e CPU). | Medium-High |   |   |
| 5 | Profile Notification Handler in isolation | Profile ML-API-Adapter Notification Handler as its one of the components showing the usage of resources (i.e CPU). | Medium-High |   |   |
|   |   |   |   |   |   |
