# Scenario 2 - FSPIOP Discovery GET Parties with ALS + Sims - ALS:v14.2.2, scale:1, k6vu:1

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. FSPIOP GET /parties request to the ALS <-- async callback response
2. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
var-testid=1690376653994
params=&from=1690376607107&to=1690377903696
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

- https://snapshots.raintank.io/dashboard/snapshot/d9zRbrMvkKrX5RMdix8xIHF3RCxEhr0e
- https://snapshots.raintank.io/dashboard/snapshot/0aMk6hS2Et1xX3AdHvt3Rx1a87P9MyVO
- https://snapshots.raintank.io/dashboard/snapshot/Haj45ymA0F2ITdgDvFuj2YCaQGEfdIp8
- https://snapshots.raintank.io/dashboard/snapshot/RUGVCysJNRR31kxuKnn0vTAfNl711M3I (cbs)
- https://snapshots.raintank.io/dashboard/snapshot/AdtPoicI5Ms3hjScM9ATcoDwYws86MrY (moja_als)
- https://snapshots.raintank.io/dashboard/snapshot/lz4z2saF4jVhH4MEhHeu2G5BhUlvaDHo
- https://snapshots.raintank.io/dashboard/snapshot/HBQOYXL0CyX5igfvc5tn7SMZAWpOmW8S

## Observations

- `Account-Lookup-Service` and the `Callback-Handler` Simulator Service are able to handle `10 Ops/s` End-to-end, while sustaining an average duration of just over `100ms`. This is shown by the following dashboards/metrics:
  - [K6](./images/Official%20k6%20Test%20Result.png)
    - `Iteration Rate` (Mean) = `10 Ops/s`
    - `Ieration Duration (avg)` (Mean) = `101ms`
  - [Callback Handler Svc](./images/Supporting%20Services%20-%20Callback%20Hander%20Service.png)
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Calculations Processed Per Second` Graph. Note the Mean includes the pre/post run.
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Performance Timing Calculations` fall-inline with the observed duration.
    - The `op:fspiop_put_parties_request` and `op:fspiop_put_parties_response` fall-inline with the observations.
    - The ingress `Ops/s` for `op:admin_get_participants_endpoints` is very low due the ALS's caching mechanism.
  - [Account-Lookup-Service](./images/dashboard-account-lookup-service.png)
    - Egress and Ingress metrics for `getPartiesByTypeAndId` and `putPartiesByTypeAndId` are similar for both `duration` and `Op/s`.
    - Most of the `duration` is observed to be spend on the `validateParticipant` @ `30ms`
    - Most of the `Op/s` is observed to be spend on the `validateParticipant` @ `30 Op/s`, a three-fold increase over other egress metrics.
  - [Docker Node Monitoring](./images/docker-prometheus-monitoring.png)
    - `Account-Lookup-Service` is showing a `100%` CPU usage (equivalent to a single core of the host machine), indicating that it is most likely being CPU constrained.
    - `Callback-Handler` is within bounds of the `Scenario #1`.

## Recommendations

- Investigate logic behind the `validateParticipant` egress implementation
- Consider implementing a **caching** mechanism for `validateParticipant` egress as it is called TWICE for each leg of the Request and the Callback Response to validate the Payer and Payee FSP.
- Investigate `Account-Lookup-Service` high CPU usage by removing configurable factors that may impact CPU usage, i.e.
  - Logging
  - Event Audits
  - Increase `UV_THREADPOOL_SIZE` for IO threads.
- Investigate enabling `HTTP Keep-Alive` for egress HTTP requests, especially the `validateParticipants`.
