# Profile the ML-Api-Adapter Notification Handler in isolation

## Hardware Specification and versions
- CPU - Intel Core i5-8600K
- Memory - 32GB
- OS - Ubuntu 23.04
- Docker - v24.0.5
- Mysql - Docker image -> mysql/mysql-server:8.0.32
- Kafka - Docker image -> bitnami/kafka:3.4.0
- Central Ledger - v17.0.3
- Node - v16.15.0

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Scale `ml-notification-handler` to 1
- Expose port `9092` of kafka service
- Expose ports for cl-sim, dfsp-sim1 and dfsp-sim2. "3001:3001", "3002:3001" and "3003:3001"
- Update `envs/cl-sim.env` with `CBH_ADMIN_FSP_ENDPOINT_MAP='{"perffsp1":"http://localhost:3002/fspiop","perffsp2":"http://localhost:3003/fspiop"}`
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://kafka:9092`
- Add `127.0.0.1 kafka` to `/etc/hosts`
- Run `docker compose --project-name ml-core -f docker-compose-perf.yml up kafka-provisioning callback-handler-svc-cl-sim sim-perffsp1 sim-perffsp2`
- Run `docker compose --project-name monitoring --profile als-test -f docker-compose-monitoring.yml up -d`


## Profile using chrome debugger
- Download [ml-api-adapter](https://github.com/mojaloop/ml-api-adapter) repo. Tested using v14.0.1.
- Change `ENDPOINT_SOURCE_URL` to `http://localhost:3001/admin` in `config/default.json`
- Run `node --inspect src/handlers/index.js handler --notification` in separate terminal
- Use `Chrome Debugger` to connect to this instance and start CPU profiling
- From `ml-perf-characterization` directory, load `messages.log` in included folder with `cat cpu-profiling/ml-notification-handler/message_large.log | kcat -b kafka:9092 -t topic-notification-event`
- Stop profiling and observe the time taken for various operations in the code

config/default.json
```
{
  "PORT": 3000,
  "HOSTNAME": "http://ml-api-adapter",
  "ENDPOINT_SOURCE_URL": "http://localhost:3001/admin",
  "ENDPOINT_HEALTH_URL": "http://localhost:3001/health",
  "ENDPOINT_CACHE_CONFIG": {
    "expiresIn": 180000,
    "generateTimeout": 30000
  },
  "PROTOCOL_VERSIONS": {
    "CONTENT": {
      "DEFAULT": "1.1",
      "VALIDATELIST": [
        "1.1",
        "1.0"
      ]
    },
    "ACCEPT": {
      "DEFAULT": "1",
      "VALIDATELIST": [
        "1",
        "1.0",
        "1.1"
      ]
    }
  },
  "ENDPOINT_SECURITY":{
    "TLS": {
      "rejectUnauthorized": true
    },
    "JWS": {
      "JWS_SIGN": false,
      "FSPIOP_SOURCE_TO_SIGN": "switch",
      "JWS_SIGNING_KEY_PATH": "secrets/jwsSigningKey.key"
    }
  },
  "MAX_CALLBACK_TIME_LAG_DILATION_MILLISECONDS": 200,
  "MAX_FULFIL_TIMEOUT_DURATION_SECONDS": 300,
  "TRANSFERS": {
    "SEND_TRANSFER_CONFIRMATION_TO_PAYEE": true
  },
  "STRIP_UNKNOWN_HEADERS": false,
  "ERROR_HANDLING": {
    "includeCauseExtension": false,
    "truncateExtensions": true
  },
  "AMOUNT": {
    "PRECISION": 10,
    "SCALE": 2
  },
  "HANDLERS": {
    "DISABLED": false,
    "API": {
      "DISABLED": false
    }
  },
  "INSTRUMENTATION": {
    "METRICS": {
      "DISABLED": false,
      "config": {
        "timeout": 5000,
        "prefix": "moja_ml_",
        "defaultLabels": {
          "serviceName": "ml-service"
        }
      }
    }
  },
  "KAFKA": {
    "TOPIC_TEMPLATES": {
      "GENERAL_TOPIC_TEMPLATE": {
        "TEMPLATE": "topic-{{functionality}}-{{action}}",
        "REGEX": "topic-(.*)-(.*)"
      }
    },
    "CONSUMER": {
      "NOTIFICATION": {
        "EVENT": {
          "config": {
            "options": {
              "mode": 2,
              "batchSize": 1,
              "pollFrequency": 10,
              "recursiveTimeout": 100,
              "messageCharset": "utf8",
              "messageAsJSON": true,
              "sync": true,
              "consumeTimeout": 1000
            },
            "rdkafkaConf": {
              "client.id": "ml-con-notification-event",
              "group.id": "ml-group-notification-event",
              "metadata.broker.list": "localhost:9092",
              "socket.keepalive.enable": true,
              "allow.auto.create.topics": true
            },
            "topicConf": {
              "auto.offset.reset": "earliest"
            }
          }
        }
      }
    },
    "PRODUCER": {
      "TRANSFER": {
        "PREPARE": {
          "config": {
            "options": {
              "messageCharset": "utf8"
            },
            "rdkafkaConf": {
              "metadata.broker.list": "localhost:9092",
              "client.id": "ml-prod-transfer-prepare",
              "event_cb": true,
              "dr_cb": true,
              "socket.keepalive.enable": true,
              "queue.buffering.max.messages": 10000000
            },
            "topicConf": {
              "request.required.acks": "1",
              "partitioner": "murmur2_random"
            }
          }
        },
        "FULFIL": {
          "config": {
            "options": {
              "messageCharset": "utf8"
            },
            "rdkafkaConf": {
              "metadata.broker.list": "localhost:9092",
              "client.id": "ml-prod-transfer-fulfil",
              "event_cb": true,
              "dr_cb": true,
              "socket.keepalive.enable": true,
              "queue.buffering.max.messages": 10000000
            },
            "topicConf": {
              "request.required.acks": "1",
              "partitioner": "murmur2_random"
            }
          }
        },
        "GET": {
          "config": {
            "options": {
              "messageCharset": "utf8"
            },
            "rdkafkaConf": {
              "metadata.broker.list": "localhost:9092",
              "client.id": "ml-prod-transfer-get",
              "event_cb": true,
              "dr_cb": true,
              "socket.keepalive.enable": true,
              "queue.buffering.max.messages": 10000000
            },
            "topicConf": {
              "request.required.acks": "1",
              "partitioner": "murmur2_random"
            }
          }
        }
      }
    }
  }
}
```

### Profiling Observations
#### Profile: CPU-20230817T151840.cpuprofile
In the bottom up and sorting by self time the function writeUtf8String is taking a long time relatively to process.
Digging down into the activity trace it was found that lines 103 and 105 in `@mojaloop/central-services-shared`
send request function takes a long time to json stringify objects.

```
103 3.0ms Logger.isInfoEnabled && Logger.info(`sendRequest::request ${JSON.stringify(requestOptions)}`)
105 10.7ms Logger.isInfoEnabled && Logger.info(`Success: sendRequest::response ${JSON.stringify(response, Object.getOwnPropertyNames(response))}`)
```

Other places of improvement were also identified in `ml-api-adapter/src/handlers/notification/index.js`

Line below can be flipped instead of parsing as the first resort.
```
224 1.1ms const id = JSON.parse(decodedPayload.body.toString()).transferId || (content.uriParams && content.uriParams.id)
```

There were no other identifiable issues with the profile run.

Due to past history with Logger statements and stringify, the conclusion was that the logger statements in
`@mojaloop/central-services-shared` were a leading issue to poor performance.


### Follow up Stories

- [[central-services-shared] JSON.stringify degrades performance on high call count function in default LOG_LEVEL=info setups](https://github.com/mojaloop/project/issues/3480)


## Status

| Ml api adapter version |  Date  | Status|
|---|---|---|
| 14.0.1 | 2023-08-24 | Baseline with a scale of 2 and 2 notification partitions 574 ops/s 🔼
| 14.0.2-snapshot.0 | 2023-08-24 | Adapter sending requests with http keep alive with a scale of 2 and 2 notification 617 ops/s 🔼
| 14.0.2-snapshot.2 | 2023-08-24 | Adapter with stringify fixes with a scale of 2 and 2 notification 657 ops/s 🔼
| 14.0.2-snapshot.5 | 2023-08-24 | Adapter with stringify fixes and http keep alive with a scale of 2 and 2 notification 671 ops/s 🔼
| 14.0.2-snapshot.11 | 2023-08-24 | Adapter with stringify fixes, http keep alive, kafka optimizations and new config with a scale of 2 and 2 notification 764 ops/s 🔼

### Isolated Performance Testing

- Download [ml-api-adapter](https://github.com/mojaloop/ml-api-adapter) repo.
- Comment out below compose definition in `docker-compose-perf.yaml`
```
      # central-ledger:
      #   condition: service_started
```
- Set `MLAPI_ENDPOINT_SOURCE_URL=http://callback-handler-svc-cl-sim:3001/admin` in perf.env
- Adjust kafka partitions and ml-handler-notification scale to desired quantity
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://kafka:9092`
- Add `127.0.0.1 kafka` to `/etc/hosts`
- docker compose --project-name monitoring -f docker-compose-monitoring.yml up -d
- Run `docker compose --project-name ml-core -f docker-compose-perf.yml up kafka kafka-provisioning callback-handler-svc-cl-sim sim-perffsp1 sim-perffsp2`
- From `ml-perf-characterization` directory, run `cat message_large.log{,}{,}{,} | kcat -b kafka:9092 -t topic-notification-event -X topic.partitioner=random -X batch.num.messages=1 -X batch.size=150`
- Run `docker compose --project-name monitoring --profile als-test -f docker-compose-monitoring.yml up -d`
- Finally, run `docker compose --project-name ml-core -f docker-compose-perf.yml up ml-handler-notification`
- Observe grafana dashboards at http://localhost:9999/

### Isolated Performance Testing Observations

- Testing was done on a non-standardized machine and there were some variations between repeated runs that would be outside the margin of error of around 3.5%.
  Recommendation would be to do further testing on a standardized machine.
- Using http keep alive snapshot of central-services-shared improved performance by 15%~.
- Services don't scale linearly when scaled up.
- Removal of stringify statements in central-services-shared reduced performance by 7 ops/s in scale 1 partition 1, which is in the realm of error.
  When scaled to 2 handlers and 2 partitions it increased performance by 13%.
- Combined improvements in v14.0.2-snapshot-5 saw an improvement of 15%~ over the baseline version of v14.0.1.
- v14.0.2-snapshot.11 including kafka optimizations from `central-services-shared` with config
  ```
    options: {
      mode: 2,
      batchSize: 10, // <-- lets pick up 10 messages at a time
      pollFrequency: 10,
      recursiveTimeout: 100,
      messageCharset: 'utf8',
      messageAsJSON: true,
      sync: true,
      syncConcurrency: 10, // <-- lets processes 10 messages at a time
      syncSingleMessage: true, // <-- this is new, and will "queue" up each message from the picked up batch to be processed by the consumer!
      consumeTimeout: 1000,
    },
    "rdkafkaConf": {
      "metadata.broker.list": "kafka:29092",
      'socket.keepalive.enable': true,
      'enable.auto.commit': false,
      'auto.commit.interval.ms': 100,
      'allow.auto.create.topics': true,
      'fetch.wait.max.ms': 0
    }
  ```
  performed well with an increase of 12%. However, the notification handler scales poorly on this version.
  There may be bottle necks with the simulator dfsps.
  When comparing isolated testing to testing on our performance vm, these configurations seem to hurt performance.
