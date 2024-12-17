# Use a base image with Java and Maven installed
FROM maven:3.8.8-eclipse-temurin-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy your project's source code and pom.xml (if you're using Maven)
COPY . /app/

# Run Maven build, which will create the target folder
RUN mvn clean package -DskipTests

# Use a minimal Java runtime image for running the app
FROM openjdk:17-jdk-slim

# Set the working directory for the final image
WORKDIR /app

# Copy the built JAR from the previous build stage
COPY --from=build /app/target/testing-1.0.0.jar /app/testing.jar
COPY --from=build /app/libs /app/libs


# Run the application
# third  argument - the full path of the main jar that was just created and moved, and the folder of all jars.
# foruth argument - Entry point of the main class 
ENTRYPOINT ["java", "-cp", "/app/testing.jar:libs/*", "org.example.Main"]
