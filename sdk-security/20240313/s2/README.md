# Scenario s2: SDK Outbound Transfers Security enabled - SDK:v23.4.1, k6vu:100

```conf
SDK Version v23.4.1
Ramping VU to 100
Security enabled
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

- Mean/Max of `29 Op/s`/`39 Op/s` with a min/mean/max response time of `175.55ms`/`2.32s`/`2.84s`

## Recommendations

- Investigate trying to upgrade nodejs http library to nodejs http2 library
  for potentially better mTLS processing speed.
