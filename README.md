
# Java Docker Build and Run Setup

This repository provides a Docker setup for building and running a Java application inside a container. The application is built using Maven and We also use external Jars files that store in the `libs` directory

## Project Structure

```
/my-java-app
    ├── Dockerfile
    ├── README.md
    ├── src/
    ├── libs/         <-- External libraries (if any)
    └── pom.xml 
```

## Dockerfile Overview

The Dockerfile performs the following tasks:

1. **Build Stage**:
   - Uses a base image with Maven and JDK installed.
   - Copies your source code into the container.
   - Runs `mvn clean package` to build the Java application and generate the JAR file in the `target` folder.

2. **Runtime Stage**:
   - Copies the generated JAR file from the build stage to the runtime image.
   - Copies libs (with all the dependencies) folder into the runtime image
   - Sets the entry point to run the Java application.

## Building the Docker Image



1. Ensure Maven is installed and configured.
2. Build the image using the following command:

   Give desired name to your image
   ```bash
   docker build -t my-java-app .
   ```

3. Once the image is built, run it:

   ```bash
   docker run my-java-app
   ```





