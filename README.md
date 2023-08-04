# ML Performance Characterization Repository

Here you will find Performance Characterizations for the Mojaloop Services.

## 1. High-Level Characterization Scenarios

| High-level Scenario  | Description  | Documentation | Notes |
|---|---|---|---|
| 1. | FSPIOP Discovery | [./fspiop-discovery/README](./fspiop-discovery/README.md) | Done |
| 2. | ~~FSPIOP Agreement~~ |   | To Be Done |
| 3. | ~~FSPIOP Transfers~~ | [./fspiop-transfers/README](./fspiop-transfers/README.md) | To Be Done |
| 4. | ~~FSPIOP Discovery + Agreement + Transfers~~ |   | To Be Done |

### 2. Capturing End-to-end Metrics

We have two approaches to capture the End-to-end metrics of a transaction.

#### 2.1 Tracestate Headers

The [Tracestate](https://github.com/mojaloop/mojaloop-specification/blob/master/fspiop-api/documents/Tracing%20v1.0.md#table-4--data-model-for-tracestate-list-member-values) header is part of the [Mojaloop Specification](https://github.com/mojaloop/mojaloop-specification/blob/master/fspiop-api/documents/Tracing%20v1.0.md) which conforms to the [W3C](https://github.com/mojaloop/mojaloop-specification/blob/master/fspiop-api/documents/Tracing%20v1.0.md#5-references) Tracing standards.

As such we are able to take advantage of this header by propogating the following key-value pairs during the End-to-end transaction:

| tracestate-key | tracestate-value | Notes |
|---|---|---|
| tx_end2end_start_ts | [timestamp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now) | Generated by the Test-runner (i.e. K6) |
| tx_callback_start_ts | [timestamp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now) | Generated by the Payee Participant Simupator (e.g. when reciving the FSPIOP GET /parties Request) |

Example header: `tracestate=tx_end2end_start_ts={{TIMESTAMP}}, tx_callback_start_ts={{TIMESTAMP}}`

#### 2.2 WebScoket Subscriptions

The Simulators (i.e. "Callback Handler Service") have been developed to support a simple WebSocket (WS) mechanism that allows the Test Executer (i.e. K6) to subscribe for Callback events.

For example, let's take the FSPIOP GET /parties use-case. Here we have K6 subscribe to a Callback via a WS on the Payer Participant Simulator based on the following properties:

1. The **TraceID**
2. The HTTP **Operation** (i.e. PUT)
3. The Party **ID** (i.e. MSDISN Number)

This ensure that the K6 subscription-notification will be unique for each test.

We gain two benefits by using this approach:

1. The K6 Runner will only iterate once the current request is completed End-to-end which means that our execution strategy is closer to a real-work scenario.
2. The K6 Runner will be able to report on the End-to-end duration and operations per second.

The down-sides of this approach, is that it only works well when we have a single Payer Participant Simulator. Its possible that we can support scaling the Payer Participant Simulator by having the K6 Runners subscribe to multiple instances, but that is currently not supported.

## 3. Types of tests

| Test Type  | Description  |
|---|---|
| **Smoke** | Validates scripts works and that our target env/system performs adequately under minimal load. |
| **Average-load** | Assess how the system performs under expected normal conditions. |
| **Stress** | Assess how the system performs at its limits when load exceeds the expected average. |
| **Spike** | Validates the behaviour and survival of the system in cases of sudden, short, and massive increases in activity. |
| **Breakpoint** | Gradually increase load to identify the capacity limits of the system. |

[Reference](https://k6.io/docs/test-types/load-test-types/#different-tests-for-different-goals).

## 4. Tools Used

| Tool | Description |
|---|---|
| **ml-core-test-harness** | The [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) is a light-weight Docker-composed based test harness used by the Mojaloop community to execute Functional, and now Performance-Characterization tests |
| **K6** | [Grafana k6](https://k6.io/docs/) is an open-source load testing tool. |
| **Docker Compose**  | [Docker Compose](https://docs.docker.com/compose/) is a tool for defining and running multi-container Docker applications. |
