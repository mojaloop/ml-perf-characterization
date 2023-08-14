# Scenario 11: FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX, dfsps:8 | 1 | Y | fspiopTransfers

```conf
var-testid=1691493807211
params=&var-testid=1691493807211&from=1691493786387&to=1691494234898

## Added for Test Scenario 6
Scale CL handlers to 2
Scale ML API and ML Notification handler to 2
Scale kafka partitions to 2
## Add for Test scenario 11
Random transfers between pool of 8 DFSPs
Increased kafka partitions to 17
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

- Got 120 ops/s, there is no increase in performance with a random pool with 8 dfsps and 17 kafka partitions. But observed the load is evenly distributed on position handler instances.

## Recommendations

-
