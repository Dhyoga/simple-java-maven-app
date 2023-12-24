FROM eclipse-temurin:latest
RUN mkdir /app
COPY target/my-app-1.0-SNAPSHOT.jar /app/myapp-java-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/app/myapp-java-1.0-SNAPSHOT.jar"]