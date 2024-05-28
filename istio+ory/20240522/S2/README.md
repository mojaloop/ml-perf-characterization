# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authentication, and Oathkeeper JWT authenticator enabled, Keto authorizer disabled.

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
  
  ![Alt text](../../images/env.svg)

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
### Keto
- Disabling keto in the resulted in better error rate and performance. This confirms an ongoing issue in the Oathkeeper -> Keto communication.

### Istio request timeout
- About 0.016% of requests to the gateway's quotes endpoint failed. This is above the threshold of 0.01%.
```bash
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": dial: i/o timeout"
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": request timeout"
``` 
- Max Response Time: 1s

### Performance Summary
- P95 Response Time: 703.99ms
- Throughput: 3.85k req/s

## Recommendations

- Investigate Istio -> Oathkeeper -> callback-handler requests pipeline.

## Test Result
![Test Result](<images/Official k6 Test Result (1).png>)