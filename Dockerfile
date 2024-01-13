FROM openjdk:17-slim
WORKDIR /app
COPY . .
CMD ["java", "-agentlib:jdwp=transport=dt_socket,address=*:5006,server=y,suspend=n" ,"-jar", "/app/target/gateway-0.0.1-SNAPSHOT.jar"]

#FROM openjdk:17-slim as build
#WORKDIR application
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} application.jar
#RUN java -Djarmode=layertools -jar application.jar extract
#
#FROM openjdk:17-slim
#WORKDIR application
#COPY --from=build application/dependencies/ ./
#COPY --from=build application/spring-boot-loader/ ./
#COPY --from=build application/snapshot-dependencies/ ./
#COPY --from=build application/application/ ./
#
#ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]