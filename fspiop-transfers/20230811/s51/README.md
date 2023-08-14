# Scenario s51: s4, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging on + audit logs on + UV_THREAD_POOL 24 + 20vus + Ml Notification JSON.stringify fix + reduced IOPS + bin_log off + local mysql + partitions 17 + kafka partition.assignment.strategy=cooperative-sticky

```conf
var-testid=xxxx
params=&var-testid=xxxx&from=1691734070581&to=1691734528176

## Changes to since last scenario
kafka partition.assignment.strategy=cooperative-sticky
VUs changed to 20
Reduced iOPS from 25k to 5k
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 8dfsp  up -d
```

## Environment

- m6i.4xlarge
  - 16 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 64gb RAM
  - SSD iO2 @ 5k

## k6 Test Config

```json
{
  "scenarios": {
    "fspiopTransfers": {
      "executor": "ramping-vus",
      "exec": "fspiopTransfersScenarios",
      "env": {
        "UNIDIRECTIONAL": "false"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "30s", "target": 20 },
        { "duration": "5m", "target": 20 }
      ]
    }
  },
  "thresholds": {
    "iteration_duration": [ "p(95)<1000" ],
    "http_req_failed": [ "rate<0.01" ],
    "http_req_duration": [ "p(95)<1000" ]
  }
}
```

## Observations

- Observed the partitions are being allocated to consumers in a group more balanced. No improvements in throughput, however partition balancing is vastly improved. Prior to this config change only 4 of the 8 Position Handlers were being assigned, after this configuration, all 8 are being assigned to a partition for mostly even processing of messages.

## Recommendations

- Configure default consumer configs with `partition.assignment.strategy=cooperative-sticky` ~ [Ref](https://github.com/confluentinc/librdkafka/blob/master/CONFIGURATION.md#:~:text=partition.assignment.strategy)
