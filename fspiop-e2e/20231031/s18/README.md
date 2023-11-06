# Scenario s18: FSPIOP E2E Discovery-Agreement-Transfer - scale:4, 4x ALS, 4x QS, 4x ML Adapter, 4x Notification, 8x CL, 12x position handler, k6vu:80

Params:
```conf
var-testid=
params=&var-testid=&from=1698727320920&to=1698727786813
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
        { "duration": "30s", "target": 80 },
        { "duration": "5m", "target": 80 }
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
