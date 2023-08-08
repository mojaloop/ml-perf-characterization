# Scenario 8: FSPIOP Transfers POST /transfers with MLAPI & CL + Unidirectional - scale:2, k6vu:MAX | 1 | Y | fspiopTransfers

```conf
var-testid=1691464806426
params=&var-testid=1691464806426&from=1691464804222&to=1691465259831

## Added for Test Scenario 6
Scale CL handlers to 2
Scale ML API and ML Notification handler to 2
Scale kafka partitions to 2
## Added for Test Scenario 8
Unidirectional transfers between perffsp1 and perffsp2
VUs set to 10
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp  up -d
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

- At 115 ops/s it performed slightly worse than a random pool with 2 dfsps.
- It might be because, with unidirectional only one position handler will be used all the time as the destination DFSPID is always same.

## Recommendations

-
