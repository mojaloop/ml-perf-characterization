# Scenario s2-NET - Profile network test using Docker for 5m with concurrency 10

```config
&from=1693992951981&to=1693993517460
```

## Environment

- m6i.4xlarge
  - 16 CPU - 3.5 GHz 3rd Generation Intel Xeon Scalable processors (Ice Lake 8375C)
  - 64gb RAM
  - HDD io2 with 100 GB, @ 5000 iOP/S
- https://gist.github.com/mdebarros/6d9ac90f33c96031cbce6b9a3ea8048e

## Running iPERF benchmark

Run the following server in a terminal:

```bash
docker run  -it --rm --name=iperf3-server -p 5201:5201 networkstatic/iperf3 -s
```

In another terminal start the client as follows:

```bash
docker run  -it --rm networkstatic/iperf3 -c $(docker inspect --format "{{ .NetworkSettings.IPAddress }}" $(docker ps -ql)) -t 300
```

## Observations

- Network Input/Output is limited to 6.46 GBytes @ 55.5 Gbits/sec
- Network packet I/O rate is `150 kp/s` (kp = kilo-packets) for both receive an transmit

## Recommendations

- Compare these limits when running Mojaloop Performance Characterization tests
