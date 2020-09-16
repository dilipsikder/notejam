FROM maven:3-jdk-8 AS MAVEN_BUILD

MAINTAINER Dilip Sikder

COPY pom.xml /build/

COPY src /build/src/

WORKDIR /build/

# download the cloudsql proxy binary
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /build/cloud_sql_proxy

RUN chmod +x /build/cloud_sql_proxy

# copy the wrapper script

COPY run.sh /build/run.sh

RUN mvn package -Dmaven.test.skip=true

FROM openjdk:8-jre-alpine

WORKDIR /app

# copy  from our build folder

COPY --from=MAVEN_BUILD /build/cloud_sql_proxy /app/

CMD ["./run.sh"]

COPY --from=MAVEN_BUILD /build/target/spring-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "spring-0.0.1-SNAPSHOT.jar"]

