FROM eclipse-temurin:11-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
# clean up the file
RUN sed -i 's/\r$//' mvnw
# run with the SH path
RUN /bin/sh mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]