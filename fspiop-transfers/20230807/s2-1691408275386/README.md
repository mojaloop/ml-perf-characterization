# Scenario 2: FSPIOP Transfers POST /transfers with Sims-only + Unidirectional - scale:1, k6vu:MAX

```conf
var-testid=1691408275386
params=&var-testid=1691408275386&from=1691408262457&to=1691408789705
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp  up -d
env K6_SCRIPT_CONFIG_FILE_NAME=fspiopTransfers.json docker compose --project-name load -f docker-compose-load.yml up -d
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
      "exec": "fspiopTransfersScenarios",
      "env": {
        "UNIDIRECTIONAL": "false"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "2m", "target": 2 },
        { "duration": "5m", "target": 2 }
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

- Observed the ops/sec reached 1000-1100 with 2 VUs. We couldn't get more ops/sec after that even we increase Vus to 4 or 6.

## Recommendations

-
