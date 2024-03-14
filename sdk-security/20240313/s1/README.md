# Scenario s1: SDK Outbound Transfers Security disabled - SDK:v23.4.1, k6vu:100

```conf
SDK Version v23.4.1
Ramping VU to 100
Security disabled
See env files for more detail
```

## Environment

## k6 Test Config

```json
{
  "scenarios": {
    "outboundSDKTransfers": {
      "executor": "ramping-vus",
      "exec": "outboundSDKTransfersScenarios",
      "env": {
        "UNIDIRECTIONAL": "true"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "1m", "target": 100 },
        { "duration": "4m", "target": 100 }
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

- Mean/Max of `225 Op/s`/`278 Op/s` with a min/mean/max response time of `17.82ms`/`146.05ms`/`185.83ms`

## Recommendations

- None. Baseline test.
