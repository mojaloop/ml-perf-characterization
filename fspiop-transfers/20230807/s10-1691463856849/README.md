# Scenario 8: FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX, dfsps:4 | 1 | Y | fspiopTransfers

```conf
var-testid=
params=&var-testid=1691463856849&from=1691463854953&to=1691464309297

## Added for Test Scenario 6
Scale CL handlers to 2
Scale ML API and ML Notification handler to 2
Scale kafka partitions to 2
## Added for Test Scenario 8
Unidirectional transfers between perffsp1 and perffsp2
VUs set to 10
## Add for Test scenario 10
DFSP pool of 4
Remove unidirectional transfers, back to random between pool of 4 DFSPs
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 4dfsp  up -d
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

- At 119 ops/s it performed within the range of unidirectional between 2 dfsps and random between 2 dfsps.

## Recommendations

-
