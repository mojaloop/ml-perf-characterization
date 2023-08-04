# Scenario 1: FSPIOP Discovery GET Parties with Sims-only - ALS:v14.2.2, scale:1, k6vu:1

The End-to-end operation from the K6 test-runner included the following HTTP operations for each *iteration*:

1. ADMIN GET /participants request to the Central-Ledger to validate payerFspId. <-- sync response
2. ADMIN GET /participants request to the Central-Ledger to validate payeeFspId. <-- sync response
3. ORACLE GET /participants request to the Oracle to resolve FSPID for payeeId. <-- sync response
4. FSPIOP GET /parties request to the ALS <-- async callback response
5. WS Subscription to the `Callback-Handler` Service for Callback Response notifications

```conf
var-testid=1690367402771
params=&var-testid=1690367402771&from=1690367297867&to=1690368635328
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

- https://snapshots.raintank.io/dashboard/snapshot/ie215NIaFsLwXIzrebhe7Dqy1QCkSFcG
- https://snapshots.raintank.io/dashboard/snapshot/ysBZLoJedpygVROKbERs287JNLjuz8k5
- https://snapshots.raintank.io/dashboard/snapshot/Nab8aB5S31oK3ey1hqb3LGq31lGJNokr
- https://snapshots.raintank.io/dashboard/snapshot/i16hs25XuA5NJ7B2eNHiF1gD0I4XYX3Q

## Observations

- `Callback-Handler` Simulator Service is able to handle `400+ Ops/s` End-to-end, while sustaining an average duration of just over `2ms`. This is shown by the following dashboards/metrics:
  - [K6](./images/Official%20k6%20Test%20Result.png)
    - `Iteration Rate` (Mean) = `461 Ops/s`
    - `Ieration Duration (avg)` (Mean) = `2.22ms`
  - [Callback Handler Svc](./images/Supporting%20Services%20-%20Callback%20Hander%20Service.png)
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Calculations Processed Per Second` Graph. Note the Mean includes the pre/post run.
    - `op:fspiop_put_parties_end2end - success:true` - observe the `E2E, Request, Response Performance Timing Calculations`. Mean is `1.86ms`.
    - The `op:fspiop_put_parties_request` and `op:fspiop_put_parties_response` fall-inline with the observes `Ops/s` and the `request` where most of the duration is spend due to the Callback-Handler sending out the **Async** `FSPIOP PUT /parties` callback response.
  - [Docker Node Monitoring](./images/docker-prometheus-monitoring.png)
    - `Callback-Handler` services show no observable resource constraint from both a memory and cpu usage.

## Recommendations

- Observe `Scenario #2+` and compare the `Callback-Handler`'s metrics against this **baseline** to determine if there are any issues with either the Mocked Simulators (i.e. `Callback-Handlers`) or the **Async** `FSPIOP PUT /parties` callback response.
