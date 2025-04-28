FROM anapsix/alpine-java
LABEL maintainer="jarang0688@soyudemedellin.edu.co"
COPY target/spring-petclinic-*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
