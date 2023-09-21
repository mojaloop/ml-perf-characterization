TOPIC_NAME=topic-transfer-position-batch
# TOPIC_NAME=topic-transfer-position

# docker exec -t kafka kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic $TOPIC_NAME
# docker exec -t kafka kafka-topics.sh --bootstrap-server localhost:9092 --create --if-not-exists --topic $TOPIC_NAME --replication-factor 1 --partitions 19

# position-prepare-5k-2dfsps.tar.gz
# position-prepare-5l-2dfsps.tar.gz
# position-prepare-5l-4dfsps.tar.gz
# position-prepare-5l-8dfsps.tar.gz
tar -xvzf position-prepare-5k-2dfsps.tar.gz

cat cl-position-handler-testing-prepare.sql | docker exec -i mysql-cl /bin/mysql central_ledger
cat kafka-topic-transfer-position-prepare.dump | docker run -i --log-driver=none -a stdin -a stdout -a stderr --network=host edenhill/kcat:1.7.1 -b localhost:9092 -t $TOPIC_NAME -X topic.partitioner=murmur2_random -K\|

rm cl-position-handler-testing-prepare.sql kafka-topic-transfer-position-prepare.dump