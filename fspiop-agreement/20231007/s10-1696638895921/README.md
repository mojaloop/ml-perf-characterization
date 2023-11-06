# Scenario s10: FSPIOP Agreement POST /quotes - scale 1 + logger fixes + passthrough mode + 15vu

Params:
```conf
var-testid=1696638895921
params=&var-testid=1696638895921&from=1696638893040&to=1696639140177

Scale 3
2 dfsp Pool
15 VUs
QUOTE_SIMPLE_ROUTING_MODE=true
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

- Max ops/s of 192.
- Iteration duration to an average of 79.4.

## Recommendations

- Try test case of 30 VUs, to see if it still results in test failure.
