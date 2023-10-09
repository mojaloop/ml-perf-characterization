# Scenario s8: FSPIOP Quotes POST /quotes + Logger Fixes - scale:2, k6vu:15

Params:
```conf
var-testid=1696550698826
params=&var-testid=1696550698826&from=1696550696158&to=1696550942106

Scale 2
2 dfsp Pool
15 VUS
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
        { "duration": "30s", "target": 15 },
        { "duration": "5m", "target": 15 }
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

- Max ops/s of 219, scaled very well with respect to scale 1 15 VU max ops/s 113.
- Lowered iteration duration to an average of 63.3 with respect to scale 1 15 VU avg of 103ms.

## Recommendations

-
