FROM amazoncorretto:11.0.18-alpine3.17
#openjdk:11-jdk-alpine

# define o diretório de trabalho
WORKDIR /opt/

# copia o jar
COPY ./exotic-standalone/target/exotic-standalone-1.11.4-SNAPSHOT.jar /opt/exotic-standalone-1.11.4-SNAPSHOT.jar

# Executa o jar
CMD ["java", "-jar", "exotic-standalone-1.11.4-SNAPSHOT.jar", "-headless", "-diagnose", "harvest", "${URL}"]
CMD ["java", "-jar", "exotic-standalone-1.11.4-SNAPSHOT.jar", "-headless", "scrape", "${URL}"]


# docker build -t exotic-generic .
# docker run -e URL="https://us.shein.com/New-in-Trends-sc-00654187.html" -t -d -P -v ./tmp/pulsar-root:/tmp/pulsar-root --name generic-exotic exotic-generic:latest


