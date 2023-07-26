# Scenario 1 - ALS-bypass Baseline with Sims-only

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

TBD

## Recommendations

TBD
