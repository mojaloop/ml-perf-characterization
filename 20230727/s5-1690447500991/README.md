# Scenario 1 - ALS-bypass Baseline with Sims-only

```conf
testid=1690447500991
params=&from=1690447463109&to=1690448001585
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
- 

## Observations

## Recommendations
