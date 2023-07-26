# Scenario 2 - ALS Baseline with Sims-only

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

TBD

## Recommendations

TBD
