FROM openjdk:17-jdk-alpine

# Instalar dependencias usando apk
RUN apk update && apk add --no-cache fontconfig

LABEL maintainer="jarango688@soyudemedellin.edu.co"
COPY target/spring-petclinic-*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]