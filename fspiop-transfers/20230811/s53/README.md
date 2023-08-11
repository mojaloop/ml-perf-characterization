# Scenario s53: s4, 4notify, 8pos - 8 dfsps + extra notification switched off via config + logging on + audit logs on + UV_THREAD_POOL 24 + 20vus + Ml Notification JSON.stringify fix + reduced IOPS + bin_log off + local mysql + partitions 19 + kafka partition.assignment.strategy=cooperative-sticky

```conf
var-testid=xxxx
params=&var-testid=xxxx&from=1691749853792&to=1691750303792

## Changes to since last scenario
Increased partitions to 19 based on the murmur hash calculation to distribute the messages evenly without any colossians

```

```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 8dfsp  up -d
```

## Environment

- m6i.4xlarge
  - 16 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 64gb RAM

## k6 Test Config

```json
{
  "scenarios": {
    "fspiopTransfers": {
      "executor": "ramping-vus",
      "exec": "fspiopTransfersScenarios",
      "env": {
        "UNIDIRECTIONAL": "false"
      },
      "startVUs": 1,
      "stages": [
        { "duration": "30s", "target": 20 },
        { "duration": "5m", "target": 20 }
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

- Observed the messages are properly being sent to partitions without collisions. No improvements in throughput

## Recommendations

-
