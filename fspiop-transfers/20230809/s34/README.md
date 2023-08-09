# Scenario s34: FSPIOP Transfers POST /transfers with MLAPI & CL + Cache + extra notification switched off env var - scale:2+8position+4notification, dfsps:8, partitions: 17, k6vu:16

```conf
var-testid=??
params=&from=1691584743688&to=1691585198922

## Added for Test Scenario 6
Scale CL handlers
- * to 2
- Pos to 8
Scale ML API Adapter
- API to 2
- Notify to 4
## Add for Test scenario 11
Random transfers between pool of 8 DFSPs
Increased kafka partitions to 17
## Add for Test scenario 29
Increase VM disk space to 100gb
Scale position handler to 8
Scale notification handler to 4
k6vu to 16
Random transfers between pool of 4 DFSPs
## Add for Test Scenario 34
Env config to disable callback notification to payee --> MLAPI_TRANSFERS__SEND_TRANSFER_CONFIRMATION_TO_PAYEE=false
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 8dfsp  up -d
```

## Environment

- m6i.4xlarge
  - 16 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 64gb RAM
  - HDD io2 with 50 GB, @ 25000 iOP/S

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
        { "duration": "30s", "target": 10 },
        { "duration": "5m", "target": 10 }
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
