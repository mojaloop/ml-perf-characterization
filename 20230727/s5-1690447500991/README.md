# Scenario 5 - ALS Baseline with Sims, no logs/audit-events

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690447500991
params=&from=1690447463109&to=1690448001585
## Added for Test Scenario 5
LOG_LEVEL=error
## Added for Test Scenario 5
EVENT_SDK_ASYNC_OVERRIDE_EVENTS=""
EVENT_SDK_LOG_FILTER=""
## Added for Test Scenario 7
UV_THREADPOOL_SIZE=16
ACCOUNT_LOOKUP_SERVICE_VERSION=v14.2.2
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

- [Docker](https://snapshots.raintank.io/dashboard/snapshot/9DU5uakoMZ2nSc18heWS7n61yLFmk9Kj)
- [K6](https://snapshots.raintank.io/dashboard/snapshot/7iQ7T6fDizAUcwakzEfgQz7syLGqDzhq?orgId=2)
- [Callback Handler Service](https://snapshots.raintank.io/dashboard/snapshot/ROW9VFS6BtBPgEm5xUeZU4i3D9WEhIg0?orgId=2)
- [Account Lookup Service](https://snapshots.raintank.io/dashboard/snapshot/q6Goz1TcZSbGgPOER0rpuCg9Od1vC0sd)
- [Nodejs moja_als](https://snapshots.raintank.io/dashboard/snapshot/XVgTjufsBsYY8UidtP33CPA77YRtj5Fr)
- [Nodejs cbs](https://snapshots.raintank.io/dashboard/snapshot/dp5L9nLn0ap1YXbxpKK826rdD5oN1D4y?orgId=2)
- [MySQL](https://snapshots.raintank.io/dashboard/snapshot/vL9eUZCcaD86IMGWklFUGJfnVIZeq5IP)

## Observations

- No observable difference between `Scenario #2`.
- Possibly no observable impact due to low through-put (i.e. `10 Op/s`).

## Recommendations

- Same as `Scenario #2`.
- Consider re-running this scenario once an increase of through-put has been observed.
