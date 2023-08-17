cat cl-position-handler-testing.sql | docker exec -i mysql-cl /bin/mysql central_ledger
cat kafka-topic-transfer-position.dump | kcat -b localhost:9092 -t topic-transfer-position