# Scenario s9: FSPIOP Quotes POST /quotes + Logger Fixes - scale:3, k6vu:15

Params:
```conf
var-testid=1696552439080
params=&var-testid=1696552439080&from=1696552436273&to=1696552682900

Scale 3
2 dfsp Pool
15 VUs
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

- Max ops/s of 274, scaled fine with respect to scale 2 15 VU max ops/s 219.
- Lowered iteration duration to an average of 51.2 with respect to scale 2 15 VU avg of 63.3ms.


## Recommendations

- Try test case of 30 VUs, to see if it still results in test failure.
