# Scenario quoting-service-kafka-s1: s1, scale 4 api handlers + scale 8 kakfa handlers + 50vu

Params:
```conf
var-testid=1705970174538
params=&var-testid=1705970174538&from=1705970171050&to=1705970627552
Scale 4 api handlers
Scale 8 kafka handlers
8 dfsp Pool
50 VUs
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
        { "duration": "30s", "target": 50 },
        { "duration": "5m", "target": 50 }
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
- Average mean of 507 ops/s compared to old quoting service with 474 ops/s
- Big improvements in round trip time with iteration duration at 80 ms vs old service with 234ms
- K6S request rate was also visibly more stable
