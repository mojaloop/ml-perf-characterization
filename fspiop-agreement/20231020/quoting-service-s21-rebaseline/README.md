# Scenario quoting-service-s21-rebaseline: s21, scale 1 + logger fixes + transaction fixes + cache fixes 60 sec cache + db/cache optimizations + complex quote request + party extension multi insert + 24 threadpool + 50vu
Params: &from=1697786724259&to=1697787180870

Params:
```conf
var-testid=1697786727277
params=&var-testid=1697786727277&from=1697786724259&to=1697787180870

Scale 1
2 dfsp Pool
50 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.2.2
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

- Max ops/s of 177.
- Iteration duration to an average of 267ms.


