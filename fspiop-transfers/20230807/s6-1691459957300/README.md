# FSPIOP Transfers POST /transfers with MLAPI & CL - scale:2, k6vu:MAX | 1 | Y | fspiopTransfers

```conf
var-testid=
params=&var-testid=1691459957300&from=1691459954582&to=1691460410705

## Added for Test Scenario 6
Scale CL handlers to 2
Scale ML API and ML Notification handler to 2
Scale kafka partitions to 2
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

- Scaling to 2 did not provide linear scaling of ops/s. Attempt of 12 vu's lead to a bottle neck of 125 ops/s.
  10 vu's resulted in 118 ops/s. For reference, in scenario #4 the system managed 87 ops/s with a maximum of 6 vu's.

## Recommendations

-
