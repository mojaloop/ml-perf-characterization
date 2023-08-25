# Central-Services-Stream

This characterization is for the [Central-Services-Stream](https://github.com/mojaloop/central-services-stream).

## Status

| Mojaloop Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|
| 15.1.0 | 2023-08-24 | [v11.1.0-snapshot.10](https://github.com/mojaloop/central-services-stream/releases/tag/v11.1.0-snapshot.10) show some improvements, specifically when dealing with `100k+` messages. The re-factor of the recursive processing mode using events instead of recursive calls improved stability and allowed all `100k+` messages to be processed without error. <br><br>Most of the performance improvements were mainly realized by optimizing configurations as per the [Summary](#summary) section below. However the newly added `syncSingleMessage` option provided a `25%` increase in performance when disabled, providing a similar performance to just batch-processing at `30%`. <br><br>The `syncSingleMessage` on **Consumers** is thus the recommended option when single messages can be concurrent processed in a controlled manner by configuring the desired concurrency to ensure adequate back-pressure (_This is especially important as seen in the situation when the Central-Ledger position handler is configured to process messages in flow mode with sync disabled - refer to `cpu-profiling/cl-position-handler` results_). <br><br>With `sync` disabled on **Consumers**, we see the "**smoothest**" processing curve on `recursive` mode, and should be the recommended approach if either a single or batch message processing is desired - `sync` should only be enabled when a `syncConcurrency` of larger than `1` is desired and `syncMessages` is true to maintain adequate back-pressure. <br><br>Compression (`LZ4`) enabled showed a minor performance improvement of ~`3%` over baseline, indicating that it is a viable option especially when transporting Kafka messages over a network to reduce the packet size and network latencies. <br><br> Producers with `sync=true` option configured will also improve back-pressure, ensuring that Kafka topic lag does run away | See [#follow-up-stores](#follow-up-stories).  |   |

## Summary

### Producer

| Scenario | Observation (Ops/s) | Difference | Notes |
|---|---|---|---|
| s00-01-default | 861 | N/A | Default (Recursive) |
| s00-02-default-producer-sync-false | 3311 | 74% |   |
| s03-producer-reduced-poll-interval | 860 | -0.12$ |
| s04-producer-increased-queue-buff-max | 90 | -856% |   |

<!--
|  |  |  |  |
-->

### Consumer

| Scenario | Observation (Ops/s) | Difference | Notes |
|---|---|---|---|
| s00-01-default.js | 4620 | N/A | Default (Recursive) |
| s01-auto-commit-enabled.js | 10051 | 54.03% | Default with auto-commit enabled |
| s02-lz4-compression.js | 4781 | 3.37% | Default with recommended LZ4 Compression enabled |
| s03-producer-reduced-poll-interval.js | 4678 | 1.24% | Poll Mode (optimized default) |
| s06-01-consumer-mode-flow.js | 5966 | 22.56% | Flow Mode (optimized default) |
| s07-01-consumer-mode-recursive.js | 5456 | 15.32% | Recursive Mode (optimized default) |
| s07-04-consumer-mode-recursive-sync-false.js | 5509 | 16.14% | Recursive Mode without sync |
| s07-03-consumer-mode-recursive-with-sync-conc-batch.js | 6190 | 25.36% | Recursive Mode sync with batch of 10 and single message sync |
| s08-consumer-mode-recursive-with-batch.js | 6603 | 30.03% | Recursive Mode with batch of 10 |
| s09-protobuf-serilization.js | 4724 | 2.20% | Default with Protobuf serializer |

<!--
|  |  |  |  |
-->

### Assumptions

- The following AWS machine was used for testing: `m6i.4xlarge`
  - `16x` vCPU - `3.5 GHz` 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - `64gb` RAM
  - HDD `io2` with `50`-`100` GB, @ `5k`-`25k` iOP/S is used unless otherwise stated (_i.e. 5k iOP/s configured from Scenario 51+ onwards_)
- Docker Version ([ref](https://gist.github.com/mdebarros/6d9ac90f33c96031cbce6b9a3ea8048e))

  ```bash
  $ docker version
  Client:
  Version:           20.10.23
  API version:       1.41
  Go version:        go1.19.8
  Git commit:        7155243
  Built:             Mon May  1 21:07:11 2023
  OS/Arch:           linux/amd64
  Context:           default
  Experimental:      true

  Server:
  Engine:
    Version:          20.10.23
    API version:      1.41 (minimum version 1.12)
    Go version:       go1.19.8
    Git commit:       6051f14
    Built:            Wed Apr 19 00:00:00 2023
    OS/Arch:          linux/amd64
    Experimental:     false
  containerd:
    Version:          1.6.19
    GitCommit:        1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f
  runc:
    Version:          1.1.7
    GitCommit:        f19387a6bec4944c770f7668ab51c4348d9c2f38
  docker-init:
    Version:          0.19.0
    GitCommit:        de40ad0
  $ docker compose version
  Docker Compose version v2.19.1
  ```

- OS Version

  ```bash
  $ cat /etc/os-release
  NAME="Amazon Linux"
  VERSION="2023"
  ID="amzn"
  ID_LIKE="fedora"
  VERSION_ID="2023"
  PLATFORM_ID="platform:al2023"
  PRETTY_NAME="Amazon Linux 2023"
  ANSI_COLOR="0;33"
  CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2023"
  HOME_URL="https://aws.amazon.com/linux/"
  BUG_REPORT_URL="https://github.com/amazonlinux/amazon-linux-2023"
  SUPPORT_END="2028-03-01"
  ```

### Test Cases

Test Case | Description | K6 Test Case | Notes
---------|---------|----------|---------
 1 | Producer - Test script to test producing Kafka messages based on a time, or number of iterations. | N/A | FSPIOP POST /transfers request executed from K6 |
 2 | Consumer - Test script to test consume Kafka messages based on a time, or number of iterations. | N/A | FSPIOP POST /transfers request executed from K6 |

### Test Scenarios

| # | Scenario | Description |
| --- | --- | --- |
| 0-1 | s00-01-default | Default recursive mode config |
| 0-2 | s00-02-default-producer-sync-false | Default recursive mode config with sync disabled |
| 1 | s01-auto-commit-enabled | Default recursive mode config with auto-commit enabled |
| 2 | s02-lz4-compression | Default recursive mode config with lz4 compression |
| 3 | s03-producer-reduced-poll-interval | Default with producer increase poller timings |
| 4 | s04-producer-increased-queue-buff-max | Default with producer queue-buff-max increased |
| 5 | s05-consumer-mode-poll | Consumer poll mode |
| 6-1 | s06-01-consumer-mode-flow | Consumer Flow mode |
| 6-2 | s06-02-consumer-mode-flow-with-sync-false | Consumer Flow mode and sync disabled |
| 7-1 | s07-01-consumer-mode-recursive | Consumer Recursive mode |
| 7-2 | s07-02-consumer-mode-recursive-with-sync-conc | Consumer Recursive mode with sync enabled and concurrency 10 |
| 7-3 | s07-03-consumer-mode-recursive-with-sync-conc-batch | Consumer Recursive mode with sync enabled and concurrency 10 and batch 10 |
| 7-4 | s07-04-consumer-mode-recursive-sync-false | Consumer Recursive mode and sync disabled |
| 8 | s08-consumer-mode-recursive-with-batch | Consumer Recursive mode and batch 10 |
| 9 | s09-protobuf-serilization |Consumer Recursive mode with ProtoBuf serlization|
| 10 | s10-default-with-sync-false | Default recursive mode with sync disabled |
| 11 | s11-part-assignment-coop-stick | Default recursive mode with sync disabled with co-op stick partition assignment |

<!--
|   |   |   |
-->

## Approach

The approach taken for characterization is follows:

### 0. Tools Used

1. NodeJS
2. Docker

### 1. Setup Tests, Test-Scenarios

#### Pre-requisites

1. Install [NVM](https://github.com/nvm-sh/nvm)
2. Install build dependencies (below commands are for AWS Linux OS)

  ```bash
  sudo yum install yum-utils
  sudo dnf install make automake gcc gcc-c++ kernel-devel
  ```

#### Checkout Code and tag

```bash
git clone https://github.com/mojaloop/central-services-stream.git
git fetch --tags origin
git checkout -b release/v11.1.0-snapshot.8 tags/v11.1.0-snapshot.8
```

#### Setup

Install Node dependencies for library:

```bash
cd ./central-services-stream
npm i
```

Install Node dependencies for Performance Test Benchmarking tools:

```bash
cd ./test/perf/
npm i
```

##### Dependencies

Starting docker compose:

```bash
docker compose --project-name css --profile all up -d
```

### 2. Capturing Performance Test Benchmarks

Run the following shell-script:

```bash
sh run.sh
```

The test results will be stored in the `./results` folder with the following format `YYYYmmDD-HHhMMmSSs.log`.

### 2. Cleaning up

Shutting down docker compose:

```bash
docker compose --project-name css --profile all down -v
```

## Follow-up stories

_Note: The stories below are not in any order of preference, and will need to be prioritized as required._

| Story | Name | Description | Impact | Issue | Notes |
|---|---|---|---|---|---|
| 1 | Re-run End-to-end tests with "recommended" configurations and learnings with latest [central-services-shared](https://github.com/mojaloop/central-services-stream). | Re-run end-to-end tests using all services build using the latest version of the [central-services-stream/releases/tag/v11.1.0](https://github.com/mojaloop/central-services-stream/releases/tag/v11.1.0) library, with the "recommendation" configuration (As per the status/summary section above) being applied to suite the type of processing being done. | Medium-High |   | e.g. <br>CL-Position-Handler<br> &nbsp;&nbsp;&nbsp;&nbsp;* Producer: `sync=true`,`queue.buffering.max.ms=0`, `compression=lz4` <br> &nbsp;&nbsp;&nbsp;&nbsp;* Consumer: `sync=false`<br>ML-API-Adapter<br> &nbsp;&nbsp;&nbsp;&nbsp;* Producer: `sync=true`,`queue.buffering.max.ms=0`, `compression=lz4` <br> &nbsp;&nbsp;&nbsp;&nbsp;* Consumer: `sync=true`, `batchSize>1`, `batchSize=syncConcurrency`, `syncSingleMessage=true` |

<!--
|   |   |   |   |   |   |
-->
