#/bin/bash
# kafka variable setting
echo "node.id=$NODE_ID" >> /home/ubuntu/kafka/config/kraft/server.properties
echo "controller.quorum.voters=1@192.168.25.26:19092" >> /home/ubuntu/kafka/config/kraft/server.properties
echo "listeners=PLAINTEXT://:9092,CONTROLLER://:19092" >> /home/ubuntu/kafka/config/kraft/server.properties
echo "advertised.listeners=PLAINTEXT://192.168.25.26:9092" >> /home/ubuntu/kafka/config/kraft/server.properties

# kafka clusert reset
UUID=`kafka-storage.sh random-uuid`
kafka-storage.sh format -t $UUID -c /home/ubuntu/kafka/config/kraft/server.properties