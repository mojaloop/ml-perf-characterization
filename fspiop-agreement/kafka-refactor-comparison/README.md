# Quoting service Kafka refactor comparison

## Observations

### 50 VU count. Refer to quoting-service-kafka-s1 vs quoting-service-kafka-s2.
- Average mean of 507 ops/s compared to old quoting service with 474 ops/s
- Big improvements in round trip time with iteration duration at 80 ms vs old service with 234ms
- K6S request rate was also visibly more stable

### 1 VU count. Refer to quoting-service-kafka-s3 vs quoting-service-kafka-s4.
- Kafka version performs significantly worse at low user load, half as fast and twice as slow.
- Average mean of 38 op/s compared to old quoting service with 84 ops/s
- Iteration duration is longer in kafka version with 22.6ms vs old service with 10.5ms
