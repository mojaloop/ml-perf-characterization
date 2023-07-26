# Scenario 6 - ALS Baseline ALS Baseline with Sims-only, HTTP-Keep-Alive enabled

```conf
testid=1690380087112
params=&from=1690379998649&to=1690381350945
ACCOUNT_LOOKUP_SERVICE_VERSION=local
```

## Notes

- ALS is a local build (based on v14.2.2) which includes the following updated `central-services-shared` lib --> [v17.6.0-snapshot.1](https://github.com/mojaloop/central-services-shared/releases/tag/v17.6.0-snapshot.1), [central-services-shared/pull/342](https://github.com/mojaloop/central-services-shared/pull/342)

## k6 Test Config

```json
{
  "scenarios": { // define scenarios
    // warm-up
    "accountLookup": { // original scenaio for accountLookup
      "executor": "ramping-vus",
      "exec": "accountLookupScenarios",
      "startVUs": 1,
      "stages": [
        { "duration": "2m", "target": 1 },
        { "duration": "15m", "target": 1 },
        { "duration": "2m", "target": 0 }
      ]
    },
  },
  "thresholds": {
    "iteration_duration": [ "p(95)<1000" ],
    "http_req_failed": [ "rate<0.01" ],
    "http_req_duration": [ "p(95)<1000" ]
  }
}
```

## Observations

## Recommendations
