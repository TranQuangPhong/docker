kafka-installation
Command uses
Move into Kafka container
docker exec -it <kafka_conatiner_id> /bin/sh

Go inside kafka installation folder
cd /opt/kafka_<version>/bin (cd /opt/kafka_2.13-2.8.1/bin)

Create Kafka topic
kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic quickstart

Start Producer app (CLI)
kafka-console-producer.sh --topic quickstart --bootstrap-server localhost:9092

Start consumer app (CLI)
kafka-console-consumer.sh --topic quickstart --from-beginning --bootstrap-server localhost:9092


***********************************
****** Other commands (phong) *****

1. Start zookeeper and kafka
zookeeper-server-start.sh config/zookeeper.properties
kafka-server-start.sh config/server.properties

2. List Kafka topic
- older kafka version:   kafka-topics.sh --list --zookeeper localhost:2181
- new kafka version:     kafka-topics.sh --list --bootstrap-server=localhost:9092

3. Describe topic
kafka-topics.sh --bootstrap-server=localhost:9092 --describe --topic <topcic_name>


# launch a Kafka consumer with Serdes
kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic bank-balance-output \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.StringDeserializer