FROM eclipse-temurin:17-jdk-alpine

# Install required dependencies for Spring Boot
RUN apk add --no-cache ttf-dejavu fontconfig

LABEL maintainer="tu@email.com"
COPY target/spring-petclinic-*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]