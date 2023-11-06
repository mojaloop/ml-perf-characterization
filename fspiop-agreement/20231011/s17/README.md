# Scenario s17: FSPIOP Agreement POST /quotes - scale 10 + logger fixes + transaction fixes + cache fixes 60 sec cache + 48 threadpool + 100vu
Params: &from=1697059077977&to=1697059540238

Params:
```conf
var-testid=
params=&var-testid=&from=1697059077977&to=1697059540238

Scale 10
2 dfsp Pool
100 VUs
QUOTE_SIMPLE_ROUTING_MODE=false
UV_THREADPOOL_SIZE=24
QUOTING_SERVICE_VERSION=v15.2.3-snapshot.2
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
        { "duration": "30s", "target": 100 },
        { "duration": "5m", "target": 100 }
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

- Diminishing returns on scaling and VUs on this machine.


