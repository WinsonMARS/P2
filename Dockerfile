# Use an official lightweight JDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set a working directory inside the container
WORKDIR /app

# Copy the JAR file from Gradle build
COPY build/libs/hello-world-java-V1.jar app.jar

# Expose the application port (change if needed)
EXPOSE 9090

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
