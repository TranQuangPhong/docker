FROM adoptopenjdk/openjdk14
WORKDIR /app
RUN apt-get update && apt-get install -y iputils-ping
RUN apt-get update && apt-get install -y vim
COPY ./Springboot_hello_micro_config_server-1.0-SNAPSHOT.jar .
CMD ["java", "-jar", "Springboot_hello_micro_config_server-1.0-SNAPSHOT.jar"]
EXPOSE 8085
