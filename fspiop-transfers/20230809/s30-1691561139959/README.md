# Scenario 30: FSPIOP Transfers POST /transfers with MLAPI & CL + Cache - scale:2, dfsps:8, partitions: 17, k6vu:MAX | 1 | Y | fspiopTransfers | .

```conf
var-testid=1691561139959
params=&var-testid=1691561139959&from=1691561128462&to=1691561561534

## Added for Test Scenario 6
Scale CL handlers to 2
Scale ML API and ML Notification handler to 2
Scale kafka partitions to 2
## Add for Test scenario 11
Random transfers between pool of 8 DFSPs
Increased kafka partitions to 17
## Add for Test scenario 29
Increase VM disk space to 100gb
Scale position handler to 8
Scale notification handler to 4
k6vu to 16
Random transfers between pool of 4 DFSPs
## Changes for Test scenario 30
Scale all services to 2
Enabled Cache for central services
Random transfers between pool of 8 DFSPs
k6vu to 12
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 8dfsp  up -d
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
        { "duration": "30s", "target": 12 },
        { "duration": "5m", "target": 12 }
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

- Request rate is 140ops/sec and iteration duration is 88ms.

## Recommendations

-
