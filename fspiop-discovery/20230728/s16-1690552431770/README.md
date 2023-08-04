# Scenario 16 - FSPIOP Discovery GET Parties with ALS + Sims + JSON.Stringify fix + validateParticipant & oracleRequests caching - ALS:v14.3.0-snapshot.0, scale:4, k6vu:6

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690552431770
params=&from=1690552427273&to=1690552806271
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
## Changes for Test Scenario 14
Up k6s VUs to 6.
## Changes for Test Scenario 15
ALS version changed to v14.2.4-snapshot.3
## Changes for Test Scenario 16
ALS version changed to v14.3.0-snapshot.0
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
        { "duration": "2m", "target": 6 },
        { "duration": "5m", "target": 6 }
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

- End-to-end max of `420 Op/s` with a mean of `14.9 ms` achieved --> Near linear Scalability achieved with 4x `Account-Lookup-Services`.

## Recommendations

- Test additional scenarios with increased `Account-Lookup-Services` scaling factor to determine if linearly scalable with 4+ instances.
- Profile the `Account-Lookup-Service` to see if any further `Event-Loop` "blockers" can be identified.
