# Benchmark

The following configuration was used for ProducerConf:

## Environment

- m6i.2xlarge
  - 8 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 32gb RAM
  - HDD io2 with 100 GB, @ 5000 iOP/S
- https://gist.github.com/mdebarros/6d9ac90f33c96031cbce6b9a3ea8048e

## Performance Test Config

```JSON
{ 
  time: 30000
}
```

## Observations

```table
┌─────────┬──────────────────────────────────────────────────────────┬────────────┬────────────────────────────┬────────┬────────────────────┬────────────────────┐
│ (index) │                         scenario                         │    name    │            date            │ count  │      ops /(s)      │    duration (s)    │
├─────────┼──────────────────────────────────────────────────────────┼────────────┼────────────────────────────┼────────┼────────────────────┼────────────────────┤
│    0    │                   's00-01-default.js'                    │ 'Producer' │ '2023-08-24T15:06:34.336Z' │ 25869  │ 861.9502329182161  │ 30.012173571109773 │
│    1    │                   's00-01-default.js'                    │ 'Consumer' │ '2023-08-24T15:06:34.336Z' │ 25869  │ 4620.110761257096  │ 5.599216412067413  │
│    2    │         's00-02-default-producer-sync-false.js'          │ 'Producer' │ '2023-08-24T15:07:12.980Z' │ 100000 │ 3311.531998758833  │ 30.197503764867783 │
│    3    │         's00-02-default-producer-sync-false.js'          │ 'Consumer' │ '2023-08-24T15:07:12.980Z' │ 100000 │ 5260.549042035486  │ 19.00942262887955  │
│    4    │               's01-auto-commit-enabled.js'               │ 'Producer' │ '2023-08-24T15:14:42.939Z' │ 25778  │ 858.8938082911717  │ 30.01302343916893  │
│    5    │               's01-auto-commit-enabled.js'               │ 'Consumer' │ '2023-08-24T15:14:42.940Z' │ 25778  │ 10051.054980631257 │ 2.5647058990001677 │
│    6    │                 's02-lz4-compression.js'                 │ 'Producer' │ '2023-08-24T15:15:18.544Z' │ 25858  │ 861.6139424655319  │ 30.011120671987534 │
│    7    │                 's02-lz4-compression.js'                 │ 'Consumer' │ '2023-08-24T15:15:18.544Z' │ 25858  │ 4781.571341663475  │ 5.407845695972442  │
│    8    │         's03-producer-reduced-poll-interval.js'          │ 'Producer' │ '2023-08-24T15:15:56.987Z' │ 25834  │ 860.7623852609836  │ 30.012928587913514 │
│    9    │         's03-producer-reduced-poll-interval.js'          │ 'Consumer' │ '2023-08-24T15:15:56.987Z' │ 25834  │ 4678.523930892698  │ 5.521827050924301  │
│   10    │       's04-producer-increased-queue-buff-max-.js'        │ 'Producer' │ '2023-08-24T15:16:35.542Z' │  2714  │ 90.45626619799597  │ 30.00344933605194  │
│   11    │       's04-producer-increased-queue-buff-max-.js'        │ 'Consumer' │ '2023-08-24T15:16:35.542Z' │  2714  │ 1800.0666646725736 │ 1.5077219378948212 │
│   12    │               's05-consumer-mode-poll.js'                │ 'Producer' │ '2023-08-24T15:17:10.065Z' │ 25938  │ 864.2977373958312  │  30.0104916138649  │
│   13    │               's05-consumer-mode-poll.js'                │ 'Consumer' │ '2023-08-24T15:17:10.065Z' │ 25938  │ 100.0885881330203  │ 259.1504234781265  │
│   14    │              's06-01-consumer-mode-flow.js'              │ 'Producer' │ '2023-08-24T15:22:02.248Z' │ 25812  │ 860.0524688487923  │ 30.012122440099716 │
│   15    │              's06-01-consumer-mode-flow.js'              │ 'Consumer' │ '2023-08-24T15:22:02.248Z' │ 25812  │ 5966.813789517948  │ 4.325926853179932  │
│   16    │      's06-02-consumer-mode-flow-with-sync-false.js'      │ 'Producer' │ '2023-08-24T15:23:04.376Z' │ 25885  │ 862.4858077272698  │ 30.012088046073913 │
│   17    │      's06-02-consumer-mode-flow-with-sync-false.js'      │ 'Consumer' │ '2023-08-24T15:23:04.376Z' │ 25885  │ 41119.033207939945 │ 0.6295138280391693 │
│   18    │           's07-01-consumer-mode-recursive.js'            │ 'Producer' │ '2023-08-24T15:23:39.495Z' │ 25871  │ 862.0101565640001  │ 30.01240739798546  │
│   19    │           's07-01-consumer-mode-recursive.js'            │ 'Consumer' │ '2023-08-24T15:23:39.495Z' │ 25871  │ 5456.166634015659  │ 4.741607383966446  │
│   20    │    's07-02-consumer-mode-recursive-with-sync-conc.js'    │ 'Producer' │ '2023-08-24T15:24:17.269Z' │ 25841  │ 861.0381906716149  │ 30.011444648981094 │
│   21    │    's07-02-consumer-mode-recursive-with-sync-conc.js'    │ 'Consumer' │ '2023-08-24T15:24:17.270Z' │ 25841  │ 5561.398692298057  │ 4.646492983102799  │
│   22    │ 's07-03-consumer-mode-recursive-with-sync-conc-batch.js' │ 'Producer' │ '2023-08-24T15:24:54.946Z' │ 25889  │ 862.6193837172492  │ 30.012077735185624 │
│   23    │ 's07-03-consumer-mode-recursive-with-sync-conc-batch.js' │ 'Consumer' │ '2023-08-24T15:24:54.946Z' │ 25889  │ 6190.246078567771  │ 4.182224692106247  │
│   24    │      's07-04-consumer-mode-recursive-sync-false.js'      │ 'Producer' │ '2023-08-24T15:25:32.160Z' │ 25824  │ 860.4646934308829  │ 30.011690423965454 │
│   25    │      's07-04-consumer-mode-recursive-sync-false.js'      │ 'Consumer' │ '2023-08-24T15:25:32.160Z' │ 25824  │ 5509.013632448527  │ 4.687590505838394  │
│   26    │       's08-consumer-mode-recursive-with-batch.js'        │ 'Producer' │ '2023-08-24T15:26:09.879Z' │ 25913  │ 863.4254696464674  │ 30.01185500192642  │
│   27    │       's08-consumer-mode-recursive-with-batch.js'        │ 'Consumer' │ '2023-08-24T15:26:09.879Z' │ 25913  │  6603.16234237581  │ 3.9243318059444428 │
│   28    │              's09-protobuf-serilization.js'              │ 'Producer' │ '2023-08-24T15:26:46.842Z' │ 26087  │  869.226070307174  │ 30.011755159139632 │
│   29    │              's09-protobuf-serilization.js'              │ 'Consumer' │ '2023-08-24T15:26:46.842Z' │ 26087  │ 4724.471921582703  │ 5.521675318002701  │
│   30    │             's10-default-with-sync-false.js'             │ 'Producer' │ '2023-08-24T15:27:25.396Z' │ 25854  │ 861.4600334665934  │ 30.011839198112487 │
│   31    │             's10-default-with-sync-false.js'             │ 'Consumer' │ '2023-08-24T15:27:25.396Z' │ 25854  │ 6401.810080517489  │ 4.038545298099518  │
│   32    │           's11-part-assignment-coop-sticky.js'           │ 'Producer' │ '2023-08-24T15:28:02.471Z' │ 25892  │ 862.7457318684533  │  30.0111597700119  │
│   33    │           's11-part-assignment-coop-sticky.js'           │ 'Consumer' │ '2023-08-24T15:28:02.471Z' │ 25892  │ 4624.599677679671  │ 5.598754877090454  │
└─────────┴──────────────────────────────────────────────────────────┴────────────┴────────────────────────────┴────────┴────────────────────┴────────────────────┘
```

## Recommendations

- When `syncMessages` on **Consumers** is enabled, ensure that the `syncConcurrency` and `batchSize` are at least matching, with larger `batchSize` scenarios requiring further test-scenarios to validate if there is any benefit.
- When `sync` on **Producers**, ensure that the `queue.buffering.max.ms` is set to near or even `0`. This will ensure that the Producer will send messages immediately without waiting for a "buffer" of messages to be queued up by the internal Librdkafka library.
- The `enable.auto.commit` option on **Consumers** provides the largest performance benefit, but it will only be feasible if we are 100% sure that our messages are re-playable, and the underlying entity state is immutable. When enabled, the `auto.commit.interval.ms` option should also be tweaked to the smallest reasonably low number possible to ensure a good balance between re-plays and consistency.
- Enabling `LZ4` compressions should be considered as it provides a slight performance improvement, and it provides the added benefit of reducing network packets and latencies
- With `sync` disabled on **Consumers** provides "**smoothest**" processing curve on `recursive` mode, and should be the recommended approach if either a single or batch message processing is desired. `sync` should only be enabled when a `syncConcurrency` of larger than 1 is desired and `syncMessages` is true.
