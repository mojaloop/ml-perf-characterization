# Scenario 1: FSPIOP Transfers POST /transfers with Sims-only + Unidirectional - scale:1, k6vu:1 | 1 | Y | fspiopTransfers

```conf
var-testid=1691163603053
params=&var-testid=1691163603053&from=1691163604063&to=1691164091573
```

- Start only DFSP simulators and run fspiopTransfersUnidirectional test case
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp  up -d
env K6_SCRIPT_CONFIG_FILE_NAME=fspiopTransfersUnidirectional.json docker compose --project-name load -f docker-compose-load.yml up -d
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
        "UNIDIRECTIONAL": "true"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "2m", "target": 1 },
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

- 

## Recommendations

- 
