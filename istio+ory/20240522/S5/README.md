# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authentication, Oathkeeper authenticator and Keto authorizer enabled.

This scenario includes setting up role-permission mapping in Keto for the test user used in this test i.e a role is setup, a permission is aadded to that role, and the test user is added to that role.

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

With the role-permission mapping, error rate was slightly elevated to 0.0095% (still below the threshold of 0.01%).


### Performance Summary
- P95 Response Time: 146.86ms
- Throughput: 3.10k req/s

## Recommendations


## Test Result
![Test Result](<images/Official k6 Test Result (8).png>)