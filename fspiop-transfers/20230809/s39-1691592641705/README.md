# Scenario s39: s2, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging on + audit logs on + UV_THREAD_POOL 24

```conf
var-testid=1691592641705
params=&var-testid=1691592641705&from=1691592639451&to=1691593094851
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
