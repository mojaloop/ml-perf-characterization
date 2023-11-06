# Scenario s17: FSPIOP E2E Discovery-Agreement-Transfer - scale:4, 4x ALS, 4x QS, 4x ML Adapter, 4x Notification, 6x CL, 12x position handler, k6vu:70

Params:
```conf
var-testid=
params=&var-testid=&from=1698725815079&to=1698726280678
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
        { "duration": "30s", "target": 70 },
        { "duration": "5m", "target": 70 }
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
