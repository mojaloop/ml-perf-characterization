# Scenario s43: s2, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging on + audit logs on + UV_THREAD_POOL 24 + 30vus + Ml Notification JSON.stringify fix + mocked central admin

```conf
var-testid=1691625582006
params=&var-testid=1691625582006&from=1691625579307&to=1691626036359

Scale 2
Scale 4 ml-notification-handler
Scale 8 central-position-handler
8 dfsp Pool
MLAPI_TRANSFERS__SEND_TRANSFER_CONFIRMATION_TO_PAYEE=false
UV_THREADPOOL_SIZE=24
ML_API_ADAPTER_VERSION=v14.0.1-snapshot.2
MLAPI_ENDPOINT_SOURCE_URL=http://callback-handler-svc-cl-sim:3001/fspiop
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
        { "duration": "30s", "target": 30 },
        { "duration": "5m", "target": 30 }
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
