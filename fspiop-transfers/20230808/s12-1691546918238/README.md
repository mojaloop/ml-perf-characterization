# Scenario 12: FSPIOP Transfers POST /transfers with MLAPI & CL with cache config enabled - scale:1, k6vu:1 | 1 | Y | fspiopTransfers

```conf
var-testid=1691546918238
params=&var-testid=1691546918238&from=1691546916199&to=1691547370092

## Add for Test scenario 12
CLEDG_CACHE__CACHE_ENABLED = true
"CACHE": {
  "CACHE_ENABLED": true,
  "MAX_BYTE_SIZE": 10000000,
  "EXPIRES_IN_MS": 1000
}
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
        { "duration": "30s", "target": 1 },
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

- With an improvement of 1 ops/s over scenario #3 which is the same scenario minus caching there is no definitive improvement.

## Recommendations

-
