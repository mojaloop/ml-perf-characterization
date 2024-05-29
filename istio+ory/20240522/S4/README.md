# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authentication, Oathkeeper authenticator and Keto authorizer enabled

The only change in this scenario (compared to S1) is scaling up Oathkeeper to 3  while keeping Keto at 1.

## Environment

- m5.4xlarge
  - CPU - 16 vCPU Up to 3.1 GHz Intel Xeon® Platinum processor
  - 32 GiB memory
  - HDD 250 GB NVMe
  - Network BW: up to 10Gbps
- Scale
  - Oathkeeper: 3
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
### Oathkeeper and Keto
- Further investigation of the errors in S1 revealed that Oathkeeper was failing a substantial number of its requests because of inability to open new ephemeral client ports to Keto due to the high volume of requests. By scaling up Oathkeeper, more ports are made available from the new container hosts. This setup resulted in lower error rate and better throughput.

### Istio gateway
- About 0.0068% of requests to the gateway's quotes endpoint failed. This is below the threshold of 0.01%.
- Max Response Time: 149ms

### Performance Summary
- P95 Response Time: 145.87ms
- Throughput: 3.32k req/s

## Recommendations

## Test Result
![Test Result](<images/Official k6 Test Result (5).png>)