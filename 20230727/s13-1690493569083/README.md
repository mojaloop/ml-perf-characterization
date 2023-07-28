# Scenario 13 - ALS Baseline with Sims-only, Disabled JSON.stringify. ALS v14.2.3 + + Scale 4 + 4x k6 VUs.

```conf
testid=1690493569083
params=&from=1690493504000&to=1690493994000
## Added for Test Scenario 5
LOG_LEVEL=error
## Added for Test Scenario 5
EVENT_SDK_ASYNC_OVERRIDE_EVENTS=""
EVENT_SDK_LOG_FILTER=""
## Added for Test Scenario 7
UV_THREADPOOL_SIZE=16
ACCOUNT_LOOKUP_SERVICE_VERSION=v14.2.3
## Changes for Test Scenario 9
Enabled in-memory storage for Mysql ALS with following config in docker-compose file
## Changes for Test Scenario 10
Disabled JSON.stringify in logResponse function of ALS
## Changes for Test Scenario 13
Up ALS scaling to 4.
Up k6s VUs to 4.
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
        { "duration": "2m", "target": 4 },
        { "duration": "5m", "target": 4 }
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

- [Docker]()
- [K6]()
- [Callback Handler Service]()
- [Account Lookup Service]()
- [Nodejs moja_als]()
- [Nodejs cbs]()
- [MySQL]()

## Observations

Roughly in our test harness a single instance of ALS can handle 1.5 VU with the specified k6s configs.

## Recommendations
