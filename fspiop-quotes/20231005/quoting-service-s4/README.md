# Scenario quoting-service-s4: s4, scale 1 + logger fixes + 1vu

Params:
```conf
var-testid=1696546237009
params=&var-testid=1696546237009&from=1696546234120&to=1696546480504

Scale 1
2 dfsp Pool
1 VUs
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

- Max ops/s of 80, up from baseline with matching config of 73 ops/s.
- Lowered Iteration duration increased to an average of 12.7ms.

## Recommendations

-
