# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authentication, Oathkeeper JWT authenticator and Keto authorizer enabled

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
### Istio request timeout
- About 5.7% of requests to the gateway's quotes endpoint failed. This is above the threshold of 0.01%.
```bash
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": dial: i/o timeout"
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": request timeout"
``` 
- Oathkeeper's error log message `connect: cannot assign requested address` suggests inability of Oathkeeper to open new connections to Keto at a high request rate.
- Max Response Time: 7.34s

### Keycloak request timeout 
- An insignificant number of requests to keycloaks token endpoint failed.
- Max. Response Time: 707ms

### Performance Summary
- P95 Response Time: 4.34s
- Throughput: 2.39k req/s

## Recommendations

- More investigation of the Ory components logs is required to unravel the cause of the high failure rate.

## Test Result
![Test Result](<images/Official k6 Test Result.png>)