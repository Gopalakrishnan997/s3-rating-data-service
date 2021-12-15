FROM maven:3.8-openjdk-8 as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/s3-rating-data-service-0.0.1-SNAPSHOT.jar s3-rating-data-service-0.0.1-SNAPSHOT.jar
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "s3-rating-data-service-0.0.1-SNAPSHOT.jar"]
