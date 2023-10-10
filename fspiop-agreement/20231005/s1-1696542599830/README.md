# Scenario s1: FSPIOP Agreement POST /quotes - scale:1, k6vu:1

Params:
```conf
var-testid=1696542599830
params=&var-testid=1696542599830&from=1696542597078&to=1696542842232

Scale 1
2 dfsp Pool
1 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.2.1
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

- Max ops/s of 73. Iteration duration average of 14.1ms.
- Ample CPU and memory available.
- Cache is working properly
- Event loop lag <4ms.
- Database size on fresh start is 3.20 MB. After a run with 8476 quotes created the end size is 31.5MB.
  Around 3.3 KB of database space used by creating one quote in persistent mode. This seems potentially quite large.

## Recommendations

-
