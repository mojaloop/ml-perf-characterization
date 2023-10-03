# Profile the Quoting service Handler in isolation

## Hardware Specification and versions
- CPU - Intel Core i5-8600K
- Memory - 32GB
- OS - Ubuntu 23.04
- Docker - v24.0.5
- Mysql - Docker image -> mysql/mysql-server:8.0.32
- Kafka - Docker image -> bitnami/kafka:3.4.0
- Quoting - v15.1.0
- Node - v18.17.1

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Scale services to 1
- Expose port `9229` and add `node --inspect=0.0.0.0` to start command of `quoting-service`
- Update `K6_SCRIPT_FSPIOP_FSP_POOL` in perf.env to use the 2 dfsp option
- Run `docker compose --project-name ml-core -f docker-compose-perf.yml --profile quotes-test --profile 2dfsp --profile ttk-provisioning-quotes up -d`
- After 5 minutes or by using docker logs -f on the testing toolkit to see if onboarding is finished run `docker compose stop central-ledger kafka`
  to remove these services that were required only for onboarding.
## Profile using chrome debugger
- Use `Chrome Debugger` to connect to the docker quoting service container and start CPU profiling
- Run `env K6_SCRIPT_CONFIG_FILE_NAME=fspiopQuotes.json docker compose --project-name load -f docker-compose-load.yml up`
- Stop profiling and observe the time taken for various operations in the code

config/default.json
```
```

### Profiling Observations
#### Profile: CPU-20231003T123612.cpuprofile
In the call tree tab, when sorting by category, under Scripting>ProcessTicksAndRejections>runMicrotasks,
we can observe the model and handler functions and click on the file to the right to open a file observer.
(These file observations can only be seen when running the test harness. Pictures are included in the profile_images folder)

The stand out problem seems to be writeLog function in several of the model logic and throughout the code.
Here is one sample from the models/quotes.js file.

```
1182 33.5ms Logger.info(`${new Date().toISOString()}, (${this.requestId}) [quotesmodel]: ${message}`)
```

Due to past history with Logger statements, the conclusion was that the logger statements in the model code
is leading to performance issues.

Another observation is that in persistent mode the `getParticipant` and `getParticipantEndpoint` database functions
are not cached.

`getParticipant` is not cached because of
```
// This has been commented out as the participant data should not be cached. This is mainly due to the scenario when the participant is made inactive vs active. Ref: https://github.com/mojaloop/project/issues/933
```

While `getParticipantEndpoint` has no reason specified. Adding endpoint caching may be a optimization.

Outside of profiling another potential issue raised by @vijayg10, the passing of the hapi request object to an async function that we don't
handle the promises such as below, may be causing side effects and crashing that preliminary testing of high virtual users
sending quote requests have shown.

```
  model.handleQuoteRequest(requestDeepCopy.headers, requestDeepCopy.payload, span).catch(err => {
    Logger.isErrorEnabled && Logger.error(`ERROR - handleQuoteRequest: ${LibUtil.getStackOrInspect(err)}`)
  })
```

### Follow up Stories

## Status

### Isolated Performance Testing

### Isolated Performance Testing Observations
