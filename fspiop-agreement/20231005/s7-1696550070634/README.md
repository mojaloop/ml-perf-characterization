# Scenario s7: FSPIOP Agreement POST /quotes + Logger Fixes - scale:2, k6vu:30

Params:
```conf
var-testid=1696550070634
params=&var-testid=1696550070634&from=1696550068026&to=1696550316794

Scale 2
2 dfsp Pool
30 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.2.2-snapshot.0
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile quotes-test --profile 2dfsp  up -d
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

- Test failure. Exceeded web socket timeout of 5ms and test thresholds.
- Adding replica of quoting service did not alleviate issue. Futher investigation needed.

## Recommendations

-
