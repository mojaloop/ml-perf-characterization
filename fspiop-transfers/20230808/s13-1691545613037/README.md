# Scenario 13: FSPIOP Transfers POST /transfers with MLAPI & CL with cache config enabled - scale:1, k6vu:MAX | 1 | Y | fspiopTransfers

```conf
var-testid=1691545613037
params=&var-testid=1691545613037&from=1691545610721&to=1691546065472

## Add for Test scenario 12
CLEDG_CACHE__CACHE_ENABLED = true
## Add for Test scenario 13
k6vu set to 6
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
        { "duration": "30s", "target": 6 },
        { "duration": "5m", "target": 6 }
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

- At 95 max ops/s there is about a 7% increase over scenario #4 which is the same scenario but with caching off.

## Recommendations

-
