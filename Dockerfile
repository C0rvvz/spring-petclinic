FROM eclipse-temurin:17-jdk  # Usa la imagen oficial de Java 17

# Instala dependencias necesarias para Alpine (si usas la versión Alpine)
RUN apt-get update && apt-get install -y fontconfig

LABEL maintainer="jarango688@soyudemedellin.edu.co"
COPY target/spring-petclinic-*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]