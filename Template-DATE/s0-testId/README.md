# Scenario 1 - ALS-bypass Baseline with Sims-only

```yaml
testid:
  - 1690367402771
params: &from=1690367297867&to=1690368635328
ACCOUNT_LOOKUP_SERVICE_VERSION: v14.2.2
```

## Environment

- m6i.2xlarge
  - 8 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 32gb RAM
- https://gist.github.com/mdebarros/6d9ac90f33c96031cbce6b9a3ea8048e

## k6 Test Config

```json
{
  "scenarios": { // define scenarios
    // warm-up
    "accountLookup": { // original scenario for accountLookup
      "executor": "ramping-vus",
      "exec": "accountLookupScenarios",
      "startVUs": 1,
      "stages": [
        { "duration": "2m", "target": 1 },
        { "duration": "5m", "target": 1 },
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

## Snapshots

- [Docker](INSERT_LINK_HERE)
- [K6](INSERT_LINK_HERE)
- [Callback Handler Service](INSERT_LINK_HERE)
- [Account Lookup Service](INSERT_LINK_HERE)
- [Nodejs moja_als](INSERT_LINK_HERE)
- [Nodejs cbs](INSERT_LINK_HERE)
- [MySQL](INSERT_LINK_HERE)

## Observations

## Recommendations
