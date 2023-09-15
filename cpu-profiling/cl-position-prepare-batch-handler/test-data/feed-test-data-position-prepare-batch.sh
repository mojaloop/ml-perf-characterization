TOPIC_NAME=topic-transfer-position-batch
# TOPIC_NAME=topic-transfer-position

docker exec -t kafka kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic $TOPIC_NAME
docker exec -t kafka kafka-topics.sh --bootstrap-server localhost:9092 --create --if-not-exists --topic $TOPIC_NAME --replication-factor 1 --partitions 19

tar -xvzf cl-position-handler-testing-prepare-50k.tar.gz

cat cl-position-handler-testing-prepare-50k.sql | docker exec -i mysql-cl /bin/mysql central_ledger
cat kafka-topic-transfer-position-prepare-50k.dump | kcat -b localhost:9092 -t $TOPIC_NAME -X topic.partitioner=murmur2_random -K\|

rm cl-position-handler-testing-prepare-50k.sql kafka-topic-transfer-position-prepare-50k.dump