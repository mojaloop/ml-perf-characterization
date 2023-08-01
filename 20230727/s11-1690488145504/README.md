# Scenario 11 - FSPIOP Discovery GET Parties with ALS + Sims + JSON.Stringify fix - ALS:v14.2.3, scale:1, k6vu:4

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
testid=1690488145504
params=&from=1690488080000&to=1690488570000
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
## Changes for Test Scenario 11
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

N/A

## Observations

- End-to-end `Ops/s` has increased by `20%` when compared to `Scenario #10`.
- End-to-end `duration` has increased by `100%` when compared to `Scenario #10`.
- `Account-Lookup-Service` and the `Callback-Handler` Simulator Service are able to handle `120 Ops/s` End-to-end, while sustaining an average duration of around `30ms`. This is shown by the following dashboards/metrics:
  - [K6](./images/Official%20k6%20Test%20Result.png)
    - `Iteration Rate` (Mean) = `113 Ops/s`
    - `Ieration Duration (avg)` (Mean) = `27.2 ms`
  - [Callback Handler Svc](./images/Supporting%20Services%20-%20Callback%20Hander%20Service.png)
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Calculations Processed Per Second` Graph. Note the Mean includes the pre/post run.
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Performance Timing Calculations` fall-inline with the observed duration.
    - The `op:fspiop_put_parties_request` and `op:fspiop_put_parties_response` fall-inline with the observations.
  - [Account-Lookup-Service](./images/dashboard-account-lookup-service.png)
    - Egress and Ingress metrics for `getPartiesByTypeAndId` and `putPartiesByTypeAndId` are similar for both `duration` and `Op/s`.
    - The `validateParticipant` is in-line with observations.
  - [Docker Node Monitoring](./images/docker-prometheus-monitoring.png)
    - `Account-Lookup-Service` is showing increased CPU usage of just over `100%`, indicating that the service is near its limit.
    - `Callback-Handler` is within bounds of the `Scenario #1`.
  - Comparing the `Event-Loop Lag` on the [NodeJS Application Dashboard for ALS](./images/NodeJS%20Application%20Dashboard%20ALS.png) between previous scenarios shows no major difference:
    - `Scenario #10` - Mean `2.41 ms`, Max `7.67 ms`, Min `1.92 ms`
    - `Scenario #11` - Mean `2.36 ms`, Max `3.82 ms`, Min `1.86 ms`

## Recommendations

- Additional profiling of the `Account-Lookup-Service` is required to further identity unnecessary or un-optimized blocking operations that may impact the NodeJs `Event Loop`. Further removing/optimizing these issues should increase the overall End-to-end `through-put` while minimizing the `duration`.
- Same as `Scenario #10` (minus this scenario).
