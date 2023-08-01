# Scenario 6 - ALS Baseline ALS Baseline with Sims, HTTP-Keep-Alive enabled

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690380087112
params=&from=1690379998649&to=1690381350945
ACCOUNT_LOOKUP_SERVICE_VERSION=local
```

## Notes

- ALS is a local build (based on v14.2.2) which includes the following updated `central-services-shared` lib --> [v17.6.0-snapshot.1](https://github.com/mojaloop/central-services-shared/releases/tag/v17.6.0-snapshot.1), [central-services-shared/pull/342](https://github.com/mojaloop/central-services-shared/pull/342)

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

## Snapshots

- https://snapshots.raintank.io/dashboard/snapshot/Tw6ZyskZ9x3xskrYHpd9SUecUD6UIxnF
- https://snapshots.raintank.io/dashboard/snapshot/K4UGykgLayBfJFEzqggiLlRGSg3glwwe
- https://snapshots.raintank.io/dashboard/snapshot/rFVzoXF5Zc40xSYZgj3EQxMoNffJ51QB
- https://snapshots.raintank.io/dashboard/snapshot/5lMKwqyt85GjmcQNBXRvnRJtoTISOu4y (cbs)
- https://snapshots.raintank.io/dashboard/snapshot/llRfjoQc8bra0urmjFkZ92P9sIXk4E2F (moja_als)
- https://snapshots.raintank.io/dashboard/snapshot/aSnvajYJEfbQyk0ht3jSishvfu4HxGkD
- https://snapshots.raintank.io/dashboard/snapshot/sG73X99iWg7PDoUdC9J6YruYjXatwk9x

## Observations

- No observable difference between `Scenario #2`.
- Possibly no observable impact due to low through-put (i.e. `10 Op/s`).

## Recommendations

- Same as `Scenario #2`.
- Consider re-running this scenario once an increase of through-put has been observed.
