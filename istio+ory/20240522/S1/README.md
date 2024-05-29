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
### Istio request timeout
- About 5.7% of requests to the gateway's quotes endpoint failed. This is above the threshold of 0.01%.
- From K6 logs:
```bash
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": dial: i/o timeout"
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": request timeout"
``` 
- From Oathkeeper's logs:
```
{"audience":"application","authorization_handler":"remote_json","error":{"message":"Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": POST http://keto-read.ory.svc.cluster.local:80/relation-tuples/check giving up after 5 attempt(s): Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": dial tcp 10.152.183.168:80: connect: cannot assign requested address"},"granted":false,"http_host":"extapi.awsdev.labsk8s1014.mojaloop.live","http_method":"POST","http_url":"http://extapi.awsdev.labsk8s1014.mojaloop.live/quotes","http_user_agent":"","level":"warning","msg":"The authorization handler encountered an error","reason_id":"authorization_handler_error","rule_id":"fspiop-api.mojaloop","service_name":"ORY Oathkeeper","service_version":"v0.40.6","subject":"c9baf4da-33d9-4a32-859e-567fec725a5a","time":"2024-05-22T14:02:33.396526491Z"}
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