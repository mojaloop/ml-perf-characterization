# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authentication enabled, Oathkeeper authenticator and Keto authorizer disabled (Istio AuthorizationPolicy disabled).

## Environment

- m5.4xlarge
  - CPU - 16 vCPU Up to 3.1 GHz Intel Xeon® Platinum processor
  - 32 GiB memory
  - HDD 250 GB NVMe
  - Network BW: up to 10Gbps
- Scale
  - Oathkeeper: 1
  - Keto: 1
  - Keycloak: 1
  - Callback handler: 1
- Test environment setup
  
  ![environment schematic diagram](../../images/env.svg)

## K6 Test Config

```JSON
{
  "tlsAuth": [{
    "cert": "<REDACTED>",
    "key": "<REDACTED>"
  }],
  "insecureSkipTlsVerify": true, 
  "scenarios": {
    "istioOryTests": {
      "executor": "ramping-vus",
      "exec": "istioOryScenarios",
      "startVUs": 5,
      "stages": [
        { "duration": "30s", "target": 50 },
        { "duration": "30s", "target": 500 },
        { "duration": "5m", "target": 1000 },
        { "duration": "9m", "target": 1000 }
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

## Observations
### Keto and Oathkeeper
- Disabling keto and oathkeeper resulted in lower error rate and better performance. This confirms an ongoing issue in the setup of Keto and possibly Oathkeeper.

### Istio request timeout
- About 0.02% of requests to the gateway's quotes endpoint failed. This is above the threshold of 0.01%.
- From k6's logs:
```bash
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": dial: i/o timeout"
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": request timeout"
``` 
- Max Response Time: 841ms

### Performance Summary
- P95 Response Time: 605.63ms
- Throughput: 3.81k req/s

## Recommendations

- This test validates an ongoing issue in the current Oathkeeper -> Keto setup discovered in S1.

## Test Result
![Test Result](<images/Official k6 Test Result (1).png>)