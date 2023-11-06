# Scenario s14: FSPIOP E2E Discovery-Agreement-Transfer - scale:2, 2x ALS, 2x QS, 2x ML Adapter, 2x Notification, 4x CL, 8x position handler, k6vu:60

Params:
```conf
var-testid=
params=&var-testid=&from=1698684977202&to=1698685440619
```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile all-services --profile 8dfsp --profile ttk-provisioning-e2e up -d
```

## k6 Test Config

```json
{
  "scenarios": {
    "fspiopTransfers": {
      "executor": "ramping-vus",
      "exec": "fspiopE2EScenarios",
      "env": {
        "UNIDIRECTIONAL": "false"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "30s", "target": 60 },
        { "duration": "5m", "target": 60 }
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
