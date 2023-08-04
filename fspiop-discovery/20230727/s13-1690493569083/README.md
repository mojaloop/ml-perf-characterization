# Scenario 13 - FSPIOP Discovery GET Parties with ALS + Sims + JSON.Stringify fix - ALS:v14.2.3, scale:4, k6vu:4

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

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
  - HDD io2 with 50 GB, @ 25000 iOP/S
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

N/A

## Observations

- End-to-end `200 Op/s` with `18.3 ms` achieved.
- Scalability looks near linear.

## Recommendations

- Increase `Account-Lookup-Service` scaling factor to determine if linearly scalable.
