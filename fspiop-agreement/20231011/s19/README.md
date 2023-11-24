# Scenario s19: FSPIOP Agreement POST /quotes - scale 1 + logger fixes + transaction fixes + cache fixes 60 sec cache + db/cache optimizations + 24 threadpool + 50vu
Params: &from=1697208140535&to=1697208597081

Params:
```conf
var-testid=
params=&var-testid=&from=1697208140535&to=1697208597081

Scale 1
2 dfsp Pool
50 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.2.3-snapshot.3
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

- More optimizations have increased ops/s by 22 over the comparable scenario s14.
