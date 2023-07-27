# Scenario 1 - ALS-bypass Baseline with Sims-only

```yaml
testid:
 - 1690407403663
 - 1690407817311
 - 1690408241620
params: &from=1690407309197&to=1690408662339
## Added for Test Scenario 7
UV_THREADPOOL_SIZE: 
  - 4 (default)
  - 8
  - 16
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

- [Docker](https://snapshots.raintank.io/dashboard/snapshot/TNhsCtVk8tI4kUsE6xvvftodNdP1q2S3)
- [K6](https://snapshots.raintank.io/dashboard/snapshot/7nFCZeE5G3jGnq9K1GZQER358S6UX4La)
- [Callback Handler Service](https://snapshots.raintank.io/dashboard/snapshot/BgBXgE0HKzNONUMAPJFMRrBU3Au6AZmQ)
- [Account Lookup Service](https://snapshots.raintank.io/dashboard/snapshot/VnCEG8L0Xax2u2HEJTfJwXzQVwM24QTi)
- [Nodejs moja_als](https://snapshots.raintank.io/dashboard/snapshot/toRA5DoN4iPTaHH7NaE1bKFbnN6aukiJ)
- [Nodejs cbs](https://snapshots.raintank.io/dashboard/snapshot/WAGXnO2NZ55DHNXm6HgJrB86B6JbmjY3)
- [MySQL](https://snapshots.raintank.io/dashboard/snapshot/ArHy56aipoKAZwgaaPRqRWS1G1Tf2L7G)

## Observations

## Recommendations
