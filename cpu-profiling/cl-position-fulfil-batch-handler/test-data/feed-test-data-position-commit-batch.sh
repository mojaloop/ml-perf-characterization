TOPIC_NAME=topic-transfer-position-batch

tar -xvzf position-commit-5l-8dfsps.tar.gz

cat cl-position-handler-testing-commit.sql | docker exec -i mysql-cl /bin/mysql central_ledger
cat kafka-topic-transfer-position-commit.dump | docker run -i --log-driver=none -a stdin -a stdout -a stderr --network=host edenhill/kcat:1.7.1 -b localhost:9092 -t $TOPIC_NAME -X topic.partitioner=murmur2_random -K\|

rm cl-position-handler-testing-commit.sql kafka-topic-transfer-position-commit.dump
