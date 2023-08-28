# Scenario s58: s4, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging on + audit logs on + UV_THREAD_POOL 24 + 30vus + Ml Notification JSON.stringify fix + reduced IOPS + bin_log off + local mysql + partitions 19 + kafka partition.assignment.strategy=cooperative-sticky + Central services shared HTTP keep-alive + Central services shared logger fixes

Params:
```conf
var-testid=1692318490857
params=&var-testid=1692318490857&from=1692318488562&to=1692318944100

Scale 4
Scale 4 ml-notification-handler
Scale 8 central-position-handler
8 dfsp Pool
MLAPI_TRANSFERS__SEND_TRANSFER_CONFIRMATION_TO_PAYEE=false
UV_THREADPOOL_SIZE=24
Reduced IOPS
## Changes to since last scenario
mysql-cl command: "--disable-log-bin"
KAFKA_PARTITIONS_NUM=19
CLEDG_KAFKA__CONSUMER__TRANSFER__POSITION__config__rdkafkaConf__partition.assignment.strategy=cooperative-sticky
ML_API_ADAPTER_VERSION=v14.0.2-snapshot.5
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 8dfsp  up -d
```

## Environment

- m6i.4xlarge
  - 16 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 64gb RAM


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
        { "duration": "30s", "target": 30 },
        { "duration": "5m", "target": 30 }
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

- The combination of HTTP alive, stringify fixes and logger.info pruning in central services shared gave an increase of 11 ops/s over s55.

## Recommendations

- Adopting the latest version of central-services-shared accross services could see more improvement.
