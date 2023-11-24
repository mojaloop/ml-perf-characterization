# Scenario s19: FSPIOP E2E Discovery-Agreement-Transfer - scale:6, 6x ALS, 6x QS, 6x ML Adapter, 6x Notification, 8x CL, 16x position handler, k6vu:90

Params:
```conf
var-testid=
params=&var-testid=&from=1698767814647&to=1698768281309
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
        { "duration": "30s", "target": 90 },
        { "duration": "5m", "target": 90 }
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
