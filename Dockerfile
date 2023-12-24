FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/myapp-1.0-SNAPSHOT.jar /app
CMD ["java", "-jar", "/app/myapp-java-1.0-SNAPSHOT.jar"]