# Scenario quoting-service-kafka-s3: s3, scale 4 api handlers + scale 8 kakfa handlers + 1vu
Params:

Params:
```conf
var-testid=170591547418
params=&var-testid=170591547418&from=1705971543860&to=1705971999129
Scale 4 api handlers
Scale 8 kafka handlers
8 dfsp Pool
1 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.6.0-snapshot.5
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile quotes-test --profile 8dfsp  up -d
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
      "exec": "fspiopQuotesScenarios",
      "env": {
        "UNIDIRECTIONAL": "false"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "30s", "target": 1 },
        { "duration": "5m", "target": 1 }
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
