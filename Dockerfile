#FROM openjdk:8-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

# Use a base Java image
FROM adoptopenjdk/openjdk17:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Java application JAR file into the container
#COPY target/test-0.0.1-SNAPSHOT.jar .
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose the port on which your Java application runs (if applicable)
EXPOSE 8080

# Command to run the Java application
#CMD ["java", "-jar", "my-java-app.jar"]
ENTRYPOINT ["java","-jar","/app.jar"]