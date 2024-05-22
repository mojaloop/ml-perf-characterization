# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authn enabled, Oathkeeper authenticator and Keto authorizer disabled (Istion AuthorizationPolicy disabled).

## Environment

- m5.4xlarge
  - CPU - 16 vCPU Up to 3.1 GHz Intel Xeon® Platinum processor
  - 32 GiB memory
  - HDD 250 GB NVMe
  - Network BW: up to 10Gbps

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



## Recommendations

- 