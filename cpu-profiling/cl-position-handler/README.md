# Profile the Central-Ledger Position Handler in isolation

## Local Setup
- Download [ml-core-test-harness](https://github.com/mojaloop/ml-core-test-harness) repository
- Disable `central-handler-position` in `docker-compose-perf.yml`
- Expose port `9092` of kafka service
- Change `KAFKA_CFG_ADVERTISED_LISTENERS` in kafka environment variables to contain `LISTENER_EXTERN://localhost:9092`
- Remove `central-handler-position` dependency in other services
- Run performance stack with two 2dfsps
- Download central-ledger repository
- Add this config to `default.json` -> `KAFKA.CONSUMER.POSITION.config.rdkafkaConf[partition.assignment.strategy]: cooperative-sticky`
- Start `position handler` using `node src/handlers/index.js handler --position`

## Profile using chrome debugger
- Run `position handler` using `node --inspect=0.0.0.0:9229 src/handlers/index.js handler --position`
- Use `Chrome Debugger` to connect to this instance and start CPU profiling
- Run Transfers using k6 script
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

## Mysql queries

The following are queries executed during a single transfer operation.

```
Query     select * from `transferDuplicateCheck` where `transferId` = 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0';
+----+-------------+------------------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table                  | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | transferDuplicateCheck | NULL       | const | PRIMARY       | PRIMARY | 146     | const |    1 |   100.00 | NULL  |
+----+-------------+------------------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

Query     insert into `transferDuplicateCheck` (`hash`, `transferId`) values ('XVyGibqb9CeeRB1F24VpXqOvEeVNg39HccPoXRpyXtE', 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0');

Query     select * from `participant` order by `name` asc;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | participant | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   11 |   100.00 | Using filesort |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+----------------+

Query     select * from `participantCurrency` order by `participantCurrencyId` asc;
+----+-------------+---------------------+------------+-------+---------------+---------+---------+------+------+----------+-------+
| id | select_type | table               | partitions | type  | possible_keys | key     | key_len | ref  | rows | filtered | Extra |
+----+-------------+---------------------+------------+-------+---------------+---------+---------+------+------+----------+-------+
|  1 | SIMPLE      | participantCurrency | NULL       | index | NULL          | PRIMARY | 4       | NULL |   86 |   100.00 | NULL  |
+----+-------------+---------------------+------------+-------+---------------+---------+---------+------+------+----------+-------+

Query     BEGIN
Query     insert into `transfer` (`amount`, `currencyId`, `expirationDate`, `ilpCondition`, `transferId`) values ('2', 'USD', '2030-01-01 00:00:00.000', '5m0gq_5dLQlTSSRKQmLpj0MZ1MtWLWgSu1oLGVTJyYs', 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0')
Query     insert into `transferParticipant` (`amount`, `ledgerEntryTypeId`, `participantCurrencyId`, `transferId`, `transferParticipantRoleTypeId`) values ('2', 1, 7, 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0', 1)
Query     insert into `transferParticipant` (`amount`, `ledgerEntryTypeId`, `participantCurrencyId`, `transferId`, `transferParticipantRoleTypeId`) values (-2, 1, 15, 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0', 2)
Query     insert into `ilpPacket` (`transferId`, `value`) values ('f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0', 'AYIDGQAAAAAAACcQIWcuZ3JlZW5iYW5rZnNwLm1zaXNkbi4yNzcxMzgwMzkxMoIC62V5SjBjbUZ1YzJGamRHbHZia2xrSWpvaU1ERXhaR1EyTldZdE5UQXpNeTAwTVdNMkxUazFaR1l0T1RFeFl6WTRPVFExWWpobUlpd2ljWFZ2ZEdWSlpDSTZJbVF3TXpJMU1EVTJMVE0xTldFdE5EUmxNUzFpT1RnMExXWXdZVFExTmpFMFkyRXpPQ0lzSW5CaGVXVmxJanA3SW5CaGNuUjVTV1JKYm1adklqcDdJbkJoY25SNVNXUlVlWEJsSWpvaVRWTkpVMFJPSWl3aWNHRnlkSGxKWkdWdWRHbG1hV1Z5SWpvaU1qYzNNVE00TURNNU1USWlMQ0ptYzNCSlpDSTZJbWR5WldWdVltRnVhMlp6Y0NKOWZTd2ljR0Y1WlhJaU9uc2ljR0Z5ZEhsSlpFbHVabThpT25zaWNHRnlkSGxKWkZSNWNHVWlPaUpOVTBsVFJFNGlMQ0p3WVhKMGVVbGtaVzUwYVdacFpYSWlPaUkwTkRFeU16UTFOamM0T1NJc0ltWnpjRWxrSWpvaWNHbHVhMkpoYm10bWMzQWlmU3dpY0dWeWMyOXVZV3hKYm1adklqcDdJbU52YlhCc1pYaE9ZVzFsSWpwN0ltWnBjbk4wVG1GdFpTSTZJa1pwY25OMGJtRnRaUzFVWlhOMElpd2liR0Z6ZEU1aGJXVWlPaUpNWVhOMGJtRnRaUzFVWlhOMEluMHNJbVJoZEdWUFprSnBjblJvSWpvaU1UazROQzB3TVMwd01TSjlmU3dpWVcxdmRXNTBJanA3SW1OMWNuSmxibU41SWpvaVZWTkVJaXdpWVcxdmRXNTBJam9pTVRBd0luMHNJblJ5WVc1ellXTjBhVzl1Vkhsd1pTSTZleUp6WTJWdVlYSnBieUk2SWxSU1FVNVRSa1ZTSWl3aWFXNXBkR2xoZEc5eUlqb2lVRUZaUlZJaUxDSnBibWwwYVdGMGIzSlVlWEJsSWpvaVEwOU9VMVZOUlZJaWZYMAA')
Query     insert into `transferStateChange` (`createdDate`, `reason`, `transferId`, `transferStateId`) values ('2023-08-17 12:27:21.891', NULL, 'f38ccd86-f4fa-4d7c-9a97-2e1fad3840c0', 'RECEIVED_PREPARE')
Query     COMMIT
```

### Observations
- The select statement on `participant` tables uses order by on `name` field. The `explain` command is showing `Using filesort`. Should investigate the cause and resolve if sorting is happening really. (May need to use FULLTEXT indexes, remove order by if its not needed ...etc)


## Setting up position handler running in isolation for executing kafka messages without need for other handlers

- Follow the instructions in `Local Setup` except running position handler with node as we want to capture unprocessed position messages from kafka as test data. We need to start with fresh deployment as we don't want to dump old data.
- Execute k6 load scenario `postTransfersNoCallback` for triggering a fixed number of transfers without waiting for a callback
- Allow some time to get all messages processed by other handlers
- Dump mysql database `central_ledger` using `mysqldump` command and store it in a file
- Dump kafka message in the topic `topic-transfer-position` using the following command
```
kcat -b localhost:9092 -t topic-transfer-position > kafka-topic-transfer-position.dump
```
- Now start the position handler and wait for the messages to be processed and observe the time taken for consuming all the messages with the help of grafana dashboards.

### Replay the messages
- Execute the script `feed-test-data.sh` to clear the necessary records in mysql database and dump kafka position messages
- Import `Position Handler Test Dashboard` in grafana and observe the processing time and throughput


## Inputs (TODO):
- Document the observations about batch processing
- Add hardware spec of dev machine, component versions ...etc
- Try sync to false
- Try use a buffer class for rawMessage assignment issue
- Enable CACHE_ENABLED and observe the difference (Also with participant select query)
- Document mysql statements for prepare and fulfil separately
- Get kafka and mysql test dumps for testing prepare and fulfil messages separately
- Investigate the missing sql update position queries from previous findings
