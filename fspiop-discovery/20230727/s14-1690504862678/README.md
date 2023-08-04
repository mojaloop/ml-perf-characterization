# Scenario 14 - FSPIOP Discovery GET Parties with ALS + Sims + JSON.Stringify fix - ALS:v14.2.3, scale:4, k6vu:6

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690504862678
params=&from=1690504843570&to=1690505393440
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

- End-to-end max of `242 Op/s` with a mean of `23.0 ms` achieved --> Scalability is not linear.

## Recommendations

- Consider implementing a **caching** mechanism for `validateParticipant` egress as it is called TWICE for each leg of the Request and the Callback Response to validate the Payer and Payee FSP.
- Profile the `Account-Lookup-Service` to see if any further `Event-Loop` "blockers" can be identified.
