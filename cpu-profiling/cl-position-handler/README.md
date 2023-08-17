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
