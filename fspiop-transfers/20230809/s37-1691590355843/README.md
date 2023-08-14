# Scenario s37: s2, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging off + audit logs off

```conf
var-testid=1691590355843
params=&var-testid=1691580670805&from=1691590353423&to=1691590810219

Scale 2
Scale 4 ml-notification-handler
Scale 8 central-position-handler
8 dfsp Pool
MLAPI_TRANSFERS__SEND_TRANSFER_CONFIRMATION_TO_PAYEE=false
LOG_LEVEL=info -> LOG_LEVEL=error
EVENT_SDK_LOG_FILTER=""
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
        { "duration": "30s", "target": 16 },
        { "duration": "5m", "target": 16 }
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
