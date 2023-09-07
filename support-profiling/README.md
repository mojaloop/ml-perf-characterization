# Central-Services-Stream

This characterization is for the [Central-Services-Stream](https://github.com/mojaloop/central-services-stream).

## Status

| Mojaloop Version |  Date  | Status  | Next  | Notes  |
|---|---|---|---|---|
| 15.1.0 | 2023-09-06 | Docker network shows a limit of `6.42 GBytes` @ `55 Gbits/sec` using iPERF3 benchmark over a 5m period, with the network I/O packet rate being around `150 kp/s` (kp = kilo-packets) for both receive an transmit, with the overall `220-280 kp/s` (10 vs 1) depending on concurrency |   |

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

### References

- [iPERF3 Docker Image](https://hub.docker.com/r/networkstatic/iperf3)
- [iPERF3 Documentation](https://iperf.fr/iperf-doc.php)

### Test Cases

Test Case | Description | K6 Test Case | Notes
---------|---------|----------|---------
   |   | N/A |  |

### Test Scenarios

| # | Scenario | Description |
| --- | --- | --- |
| 1-NET | Profile network test using Docker for 5m | iPerf benchmark test executed using docker containers for a period of 5m. |
| 2-NET | Profile network test using Docker for 5m with concurrency 10 | iPerf benchmark test executed using docker containers for a period of 5m and a concurrency of 5m. |

<!--
|   |   |   |
-->

## Follow-up stories

_Note: The stories below are not in any order of preference, and will need to be prioritized as required._

| Story | Name | Description | Impact | Issue | Notes |
|---|---|---|---|---|---|
|   |   |   |   |   |   |

<!--
|   |   |   |   |   |   |
-->
