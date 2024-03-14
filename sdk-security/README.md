# SDK Security Overhead Performance Characterization


## Test Cases

Test Case | Description | K6 Test Case | Notes
---------|---------|----------|---------|
 1 | Outbound SDK Transfer | outboundSDKTransfers | SDK POST /transfers request executed from K6 via the SDK |

## Test Scenarios

### Assumptions

- The following VM machine was used for testing: `m6i.2xlarge`
  - `8` vCPU - `3.5 GHz` 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - `32gb` RAM
  - HDD `io2` with `100` GB, @ `25k` iOP/S is used unless otherwise stated (_i.e. 5k iOP/s configured from Scenario 51+ onwards_)

  - 32 vCores - `3.3 GHz` ( 16 sockets) AMD EPYC 7302
  - `65gb` RAM
  - NVME SSD with `250` GB

  ```bash
  $ docker version
  Client: Docker Engine - Community
  Version:           25.0.3
  API version:       1.44
  Go version:        go1.21.6
  Git commit:        4debf41
  Built:             Tue Feb  6 21:13:09 2024
  OS/Arch:           linux/amd64
  Context:           default

  Server: Docker Engine - Community
  Engine:
    Version:          25.0.3
    API version:      1.44 (minimum version 1.24)
    Go version:       go1.21.6
    Git commit:       f417435
    Built:            Tue Feb  6 21:13:09 2024
    OS/Arch:          linux/amd64
    Experimental:     false
  containerd:
    Version:          1.6.28
    GitCommit:        ae07eda36dd25f8a1b98dfbf587313b99c0190bb
  runc:
    Version:          1.1.12
    GitCommit:        v1.1.12-0-g51d5e94
  docker-init:
    Version:          0.19.0
    GitCommit:        de40ad0
  ```

- OS Version

  ```bash
  $ cat /etc/os-release
  PRETTY_NAME="Ubuntu 22.04.4 LTS"
  NAME="Ubuntu"
  VERSION_ID="22.04"
  VERSION="22.04.4 LTS (Jammy Jellyfish)"
  VERSION_CODENAME=jammy
  ID=ubuntu
  ID_LIKE=debian
  HOME_URL="https://www.ubuntu.com/"
  SUPPORT_URL="https://help.ubuntu.com/"
  BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
  PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
  UBUNTU_CODENAME=jammy
  ```

### Scenarios

Scenario | Description | Test-Case | Repeatable (Y/N) | K6 Test Scenario / Config | Notes
---------|----------|---------|---------|---------|---------
 1 | SDK Outbound Transfers Security disabled - SDK:v23.4.1, k6vu:100 | 1 | Y | outboundSDKTransfers | .
 2 | SDK Outbound Transfers Security enabled - SDK:v23.4.1, k6vu:100 | 1 | Y | outboundSDKTransfers | .


### Approach

The approach taken for characterization is follows:

#### 0. Tools Used

Refer to [../README.md](../README.md) for more information.

#### 1. Setup Tests, Test-Scenarios & ml-core-test-harness

Initially setup the ml-core-test-harness to support the [Test Scenarios](#test-scenarios) described above. This is done by setting removing all externalized dependencies by simulating them with a simulator (also known as the "Callback Handler Service").

Refer to the following diagram showing the **SDK Transfer** characterization interaction diagram:

![fspiop-discovery-characterization-end-to-end-bypassing-with-als-and-sim.drawio](../assets/images/fspiop-discovery-characterization-end-to-end-bypassing-with-als-and-sim.drawio.png)

In the above, the "Callback Handler Service" has been used to simulate the following SDK's dependencies:

- **Payer FSP** - The Payer FSP Participant that will be used to initiate the SDK Transfer workflow.
- **Payee FSP** - The Payee FSP Participant that will be used to respond to FSPIOP /parties, /quotes and /transfers requests.

In this stage we would also identify:

1. any metrics that are required to correctly measure and monitoring out tests.
2. any dashboards that are required to visualize that information.

## Follow-up stories

| Story | Name | Description | Impact | Issue | Notes |
|---|---|---|---|---|---|
| 1 | **Investigate http config/http2** | Investigate http config for mTLS performance improvements and http2 library migration and benefits.. | High | [mojaloop/#3809](https://github.com/mojaloop/project/issues/3809)  |   |
