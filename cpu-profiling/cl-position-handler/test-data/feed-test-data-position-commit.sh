cat cl-position-handler-testing-commit.sql | docker exec -i mysql-cl /bin/mysql central_ledger
cat kafka-topic-transfer-position-commit.dump | kcat -b localhost:9092 -t topic-transfer-position -X topic.partitioner=murmur2_random