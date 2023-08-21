# Profile the Central-Ledger Position Handler in isolation

## Hardware Specification and versions
CPU - AMD Ryzen 9 3900X 12-Core Processor
Memory - 32GB
OS - Ubuntu 23.04
Docker - v24.0.5
Mysql - Docker image -> mysql/mysql-server:8.0.32
Kafka - Docker image -> bitnami/kafka:3.4.0
Central Ledger - v17.0.3
Node - v16.15.0

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://localhost:9092`
- Start the docker services for dependencies
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test up -d kafka-provisioning kafka mysql-cl
```
- Download central-ledger repository
- Add this config to `default.json` -> `KAFKA.CONSUMER.POSITION.config.rdkafkaConf[partition.assignment.strategy]: cooperative-sticky`
- Start `position handler` using the following
```
npm run migrate
node src/handlers/index.js handler --position
```
- Add the new target `<Docker IP of Host>:3001` (ex: 172.17.0.1:3001) to `prometheus.yml`
- Start monitoring services using the following command
```
docker compose --project-name monitoring --profile transfers-test -f docker-compose-monitoring.yml up -d
```

## Triggering position messages

- Execute the following script for the messages `action=prepare`
```
sh ./feed-test-data-prepare.sh
```
- Execute the following script for the messages `action=commit`
```
sh ./feed-test-data-commit.sh
```
- Now you should see the activity in position handler service
- Observe the grafana dashboard `mojaloop-central-ledger` for `Processed requests per second` and `Processing Time`

---

## Profile using chrome debugger
- Run `position handler` using `node --inspect=0.0.0.0:9229 src/handlers/index.js handler --position`
- Use `Chrome Debugger` to connect to this instance and start CPU profiling
- Trigger prepare / commit messages
- Stop profiling and observe the time taken for various operations in the code

### Observations
#### Profile: CPU-20230817T142002.cpuprofile
- The following lines of code seems taking more time in `models/position/facade.js`
```
reservedTransfers[transfer.transferId] = { transferState, transfer, rawMessage, transferAmount }

processedTransfers[transferId] = { transferState, transfer, rawMessage, transferAmount, runningPosition, runningReservedValue }
```
TODO: Need to investigate the cause. I doubt copying `rawMessage` which is a buffer is causing this. We can have a simple test program to verify this.
- The following line seems incorrect if we want parallel execution of those queries. The `initialTransferStateChangePromises` should contain promises, so there should not be `await` before knex call.
```
initialTransferStateChangePromises.push(await knex('transferStateChange').transacting(trx).where('transferId', id).orderBy('transferStateChangeId', 'desc').first())
```
- Need to double check if the knex library is handling the re-use of mysql pool of connections properly instead creating new connection every time

## Profiling using Clinic.js bubbleprof
- Install clinic.js tool
- Stop the central ledger position handler node service
- Start the service using Clinic.js
```
clinic bubbleprof -- node src/handlers/index.js handler --position
```
- Run the k6 load
- Terminate the position handler and it opens up an html file immediately.
- Sometimes you may see an error `Analysing dataError: premature close`, no need to worry in this case. The profile data is already saved in the current folder `.clinic`. We can generate the html report from the profile dump using the following command.
```
clinic bubbleprof --visualize-only .clinic/<PID>.clinic-bubbleprof
```

### Observations
#### Profile: 892321.clinic-bubbleprof.html
- Observed `23,659 ms in asynchronous delays, 19,145 ms in synchronous delays.` in mysql connect calls
```
at Socket.Socket.connect node:net:993:7
at Connection.connect ../../node_modules/mysql/lib/Connection.js:76:13
at  ../../node_modules/@mojaloop/central-services-database/node_modules/knex/lib/dialects/mysql/index.js:56:18
at Client_MySQL.acquireRawConnection ../../node_modules/@mojaloop/central-services-database/node_modules/knex/lib/dialects/mysql/index.js:51:12
at create ../../node_modules/@mojaloop/central-services-database/node_modules/knex/lib/client.js:237:39
```
TODO: Need to investigate the cause of this issue

---

## Mysql queries

The following are the queries executed during a prepare / commit message handling operation.

### Prepare
```
2023-08-21T12:04:15.916493Z        28 Query     select * from `settlementModel` where `isActive` = 1
2023-08-21T12:04:15.918116Z        28 Query     select * from `participant`
2023-08-21T12:04:15.918940Z        28 Query     select * from `participantCurrency` order by `participantCurrencyId` asc
2023-08-21T12:04:15.920707Z        28 Query     BEGIN
2023-08-21T12:04:15.921503Z        28 Query     select * from `transferStateChange` where `transferId` = '9d74acdb-d7da-4362-8f45-661d4fb2c12e' order by `transferStateChangeId` desc limit 1
2023-08-21T12:04:15.922233Z        28 Query     select * from `participantPosition` where `participantCurrencyId` in (7, 8) for update
2023-08-21T12:04:15.922971Z        28 Query     update `participantPosition` set `participantPositionId` = 7, `participantCurrencyId` = 7, `value` = 0, `reservedValue` = '2.0000', `changedDate` = '2023-08-21 12:04:15.921' where `participantPositionId` = 7
2023-08-21T12:04:15.923564Z        41 Query     select * from `participantLimit`
2023-08-21T12:04:15.924732Z        28 Query     update `participantPosition` set `value` = '2.0000', `reservedValue` = '0.0000', `changedDate` = '2023-08-21 12:04:15.921' where `participantPositionId` = 7
2023-08-21T12:04:15.925035Z        28 Query     select * from `transfer` where `transferId` in ('9d74acdb-d7da-4362-8f45-661d4fb2c12e') for update
2023-08-21T12:04:15.926852Z        28 Query     insert into `transferStateChange` (`createdDate`, `reason`, `transferId`, `transferStateChangeId`, `transferStateId`) values ('2023-08-17 15:25:07.000', NULL, '9d74acdb-d7da-4362-8f45-661d4fb2c12e', NULL, 'RESERVED')
2023-08-21T12:04:15.928243Z        28 Query     insert into `participantPositionChange` (`participantPositionId`, `reservedValue`, `transferStateChangeId`, `value`) values (7, '0.0000', 5073, '2.0000')
2023-08-21T12:04:15.928811Z        28 Query     COMMIT
```

### Commit
```
2023-08-21T12:07:32.588127Z        28 Query     select `transferParticipant`.*, `tsc`.`transferStateId`, `tsc`.`reason` from `transferParticipant` inner join `transferStateChange` as `tsc` on `tsc`.`transferId` = `transferParticipant`.`transferId` where `transferParticipant`.`transferId` = '8cc5c52d-3b9f-4db3-a848-22c7cb842b10' and `transferParticipant`.`transferParticipantRoleTypeId` = 2 and `transferParticipant`.`ledgerEntryTypeId` = 1 order by `tsc`.`transferStateChangeId` desc limit 1
2023-08-21T12:07:32.589670Z        28 Query     BEGIN
2023-08-21T12:07:32.589984Z        28 Query     select * from `participantPosition` where `participantCurrencyId` = 15 limit 1 for update
2023-08-21T12:07:32.590675Z        28 Query     update `participantPosition` set `value` = '4958.0000', `changedDate` = '2023-08-21 12:07:32.589' where `participantCurrencyId` = 15
2023-08-21T12:07:32.591307Z        28 Query     insert into `transferStateChange` (`createdDate`, `transferId`, `transferStateId`) values ('2023-08-21 12:07:32.589', '8cc5c52d-3b9f-4db3-a848-22c7cb842b10', 'COMMITTED')
2023-08-21T12:07:32.591633Z        28 Query     select * from `transferStateChange` where `transferId` = '8cc5c52d-3b9f-4db3-a848-22c7cb842b10' order by `transferStateChangeId` desc limit 1 for update
2023-08-21T12:07:32.591949Z        28 Query     insert into `participantPositionChange` (`createdDate`, `participantPositionId`, `reservedValue`, `transferStateChangeId`, `value`) values ('2023-08-21 12:07:32.589', 15, 0, 15073, '4958.0000')
2023-08-21T12:07:32.592567Z        28 Query     COMMIT
```

### Observations
- The select statement on `participant` tables uses order by on `name` field. The `explain` command is showing `Using filesort`. Should investigate the cause and resolve if sorting is happening really. (May need to use FULLTEXT indexes, remove order by if its not needed ...etc)
- The select statement on `transfer` table has `for update` which I think locks the row in transfer table which is not neccessary although there might not be any other processes try to update the same transfer record.

---

## TODO: Overall Observations
- participant order by difference
- Copy rawBuffer difference
- Batch processing -> refer the issue with Promise.all in chrome profile observations
- Kafka consumer congiration - sync false
- CACHE_ENABLED

---

## Appendix

### Capturing Kafka and MySQL dumps for position-prepare
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Expose port `9092` of kafka service
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://localhost:9092`
- Run the services except position handler
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp --profile ttk-provisioning-transfers up -d --scale central-handler-position=0
```
- Wait for the TTK provisioning to be completed
- Note: We need to start with fresh deployment as we don't want to dump old data.
- Execute k6 load scenario `postTransfersNoCallback` for triggering a fixed number of transfers without waiting for a callback
- Allow some time to get all messages processed by other handlers
- Dump mysql database `central_ledger` using `mysqldump` command and store it in a file
```
docker exec -it mysql-cl /bin/mysqldump central_ledger > cl-position-handler-testing-prepare.sql
```
- Dump kafka message in the topic `topic-transfer-position` using the following command
```
kcat -b localhost:9092 -t topic-transfer-position > kafka-topic-transfer-position-prepare.dump
```

### Capturing Kafka and MySQL dumps for position-commit
- Now start the position handler and disable fulfil handler
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp  --profile debug up -d --scale ml-handler-notification=1 --scale central-handler-prepare=1 --scale mojaloop-testing-toolkit=0 --scale mojaloop-testing-toolkit-ui=0 --scale central-ledger=1 --scale ml-api-adapter=1 --scale central-handler-position=1 --scale central-handler-fulfil=0
```
- Wait for the fulfil topic is filled with messages
- Disable position handler and enable fulfil handler again
```
docker compose --project-name ml-core -f docker-compose-perf.yml --profile transfers-test --profile 2dfsp  --profile debug up -d --scale ml-handler-notification=1 --scale central-handler-prepare=1 --scale mojaloop-testing-toolkit=0 --scale mojaloop-testing-toolkit-ui=0 --scale central-ledger=1 --scale ml-api-adapter=1 --scale central-handler-position=0 --scale central-handler-fulfil=1
```
- Wait for the messages to be processed by fulfil handler
- Capture the kafka messages from position topic
```
kcat -b localhost:9092 -t topic-transfer-position > kafka-topic-transfer-position-total.dump
cat kafka-topic-transfer-position-total.dump |grep '"action":"commit"' > kafka-topic-transfer-position-commit.dump
rm kafka-topic-transfer-position-total.dump
```
- Capture mysql database state
```
docker exec -it mysql-cl /bin/mysqldump central_ledger > cl-position-handler-testing-commit.sql
```


## Inputs (TODO):
- Document the observations about batch processing
- // Add hardware spec of dev machine, component versions ...etc
- // Try sync to false
- Try use a buffer class for rawMessage assignment issue
- // Enable CACHE_ENABLED and observe the difference (Also with participant select query)
- // Document mysql statements for prepare and fulfil separately
- // Get kafka and mysql test dumps for testing prepare and fulfil messages separately
- // Investigate the missing sql update position queries from previous findings

