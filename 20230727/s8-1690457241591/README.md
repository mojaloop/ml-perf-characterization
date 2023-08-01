# Scenario 8 - ALS Baseline with Sims, multiple k6 VUs

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690457241591
params=&from=1690457230868&to=1690457768004
## Added for Test Scenario 5
LOG_LEVEL=error
## Added for Test Scenario 5
EVENT_SDK_ASYNC_OVERRIDE_EVENTS=""
EVENT_SDK_LOG_FILTER=""
## Added for Test Scenario 7
UV_THREADPOOL_SIZE=16
ACCOUNT_LOOKUP_SERVICE_VERSION=v14.2.2
## Changes for Test Scenario 8
Increased target VUs from 1 to 5
```

## Environment

- m6i.2xlarge
  - 8 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 32gb RAM
- https://gist.github.com/mdebarros/6d9ac90f33c96031cbce6b9a3ea8048e

## k6 Test Config

```json
{
  "scenarios": {
    "accountLookup": {
      "executor": "ramping-vus",
      "exec": "accountLookupScenarios",
      "startVUs": 1,
      "stages": [
        { "duration": "2m", "target": 1 },
        { "duration": "5m", "target": 5 }
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

## Snapshots

- [K6](https://snapshots.raintank.io/dashboard/snapshot/yCQaL9Qz7WcFDcH2v4Yik9vWR1WuO55f?orgId=2)

## Observations

- Minimal observable difference between `Scenario #2`, same observations apply in addition too:
  - Http response time (Sync response) increased proportional to number VUs which is weird.
- Possibly no observable impact due to low through-put (i.e. `10 Op/s`).

## Recommendations

- Same as `Scenario #2`.
- Consider re-running this scenario once an increase of through-put has been observed.
