# Docker container for pictochat

# create build stage
FROM gradle:8-jdk8 AS build
WORKDIR /app

# copy files to container
COPY . ./

# build JAR file
RUN sh gradlew build

# run pictochat server
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "./build/libs/ayunpictojava-1.0-SNAPSHOT.jar" ]
