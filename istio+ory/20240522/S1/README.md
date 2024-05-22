# Scenario: POST /quotes request through Istio gateway with mTLS, Keycloak authn, Oathkeeper authenticator enabled and Keto authorizer enabled

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

- Istio request timeout

msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": dial: i/o timeout"
msg="Request Failed" error="Post \"https://extapi.awsdev.labsk8s1014.mojaloop.live/quotes\": request timeout"

 - Max 7.34s response time

- Keycloak request timeout - insignificant count, most requests were successful
  - Max. 707ms response time

Total failures: 11.4% mostly comming from Istio endpoint (could have been the ory components or istio itself - needs digging)

OATHKEEPER error log
024-05-22T15:02:33+01:00 {"audience":"application","authorization_handler":"remote_json","error":{"message":"Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": POST http://keto-read.ory.svc.cluster.local:80/relation-tuples/check giving up after 5 attempt(s): Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": dial tcp 10.152.183.168:80: connect: cannot assign requested address"},"granted":false,"http_host":"extapi.awsdev.labsk8s1014.mojaloop.live","http_method":"POST","http_url":"http://extapi.awsdev.labsk8s1014.mojaloop.live/quotes","http_user_agent":"","level":"warning","msg":"The authorization handler encountered an error","reason_id":"authorization_handler_error","rule_id":"fspiop-api.mojaloop","service_name":"ORY Oathkeeper","service_version":"v0.40.6","subject":"c9baf4da-33d9-4a32-859e-567fec725a5a","time":"2024-05-22T14:02:33.396526491Z"}

2024-05-22T15:02:33+01:00 {"audience":"application","error":{"message":"Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": POST http://keto-read.ory.svc.cluster.local:80/relation-tuples/check giving up after 5 attempt(s): Post \"http://keto-read.ory.svc.cluster.local:80/relation-tuples/check\": dial tcp 10.152.183.168:80: connect: cannot assign requested address"},"granted":false,"http_host":"extapi.awsdev.labsk8s1014.mojaloop.live","http_method":"POST","http_url":"http://extapi.awsdev.labsk8s1014.mojaloop.live/quotes","http_user_agent":"","level":"info","msg":"Access request denied","service_name":"ORY Oathkeeper","service_version":"v0.40.6","time":"2024-05-22T14:02:33.396592346Z"}



## Recommendations

- 