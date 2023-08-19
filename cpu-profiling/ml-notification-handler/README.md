# Profile the ML-Api-Adapter Notification Handler in isolation

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Scale `ml-notification-handler` to 1
- Expose port `9092` of kafka service
- Expose ports for cl-sim, dfsp-sim1 and dfsp-sim2. "3001:3001", "3002:3001" and "3003:3001"
- Update `envs/cl-sim.env` with `CBH_ADMIN_FSP_ENDPOINT_MAP='{"perffsp1":"http://localhost:3002/fspiop","perffsp2":"http://localhost:3003/fspiop"}`
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://localhost:9092`
- Run `docker compose --project-name ml-core -f docker-compose-perf.yml up kafka-provisioning callback-handler-svc-cl-sim sim-perffsp1 sim-perffsp2`

## Profile using chrome debugger
- Download [ml-api-adapter](https://github.com/mojaloop/ml-api-adapter) repo. Tested using v14.0.1.
- Change `ENDPOINT_SOURCE_URL` to `http://localhost:3001/admin` in `config/default.json`
- Run `node --inspect src/handlers/index.js handler --notification` in separate terminal
- Use `Chrome Debugger` to connect to this instance and start CPU profiling
- Preload load `messages.log` in included folder with `cat messages.log | kcat -b localhost:9092 -t topic-notification-event`
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

### Isolated Performance Testing


### Observations
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
