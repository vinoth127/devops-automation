FROM openjdk:11
EXPOSE 8081
ADD target/tcare.jar tcare.jar
ENTRYPOINT ["java","-jar","/tcare.jar"]