FROM maven:latest as builder
LABEL Description="Multistage dockerfile" Vendor="keefeere" Version="1.0"

ARG NEXUS_ADMIN_PASS
ENV NEXUS_ADMIN_PASS=$NEXUS_ADMIN_PASS


COPY settings.xml /usr/share/maven/ref/
COPY ./app /app

#Testing
#RUN echo Admin pass $NEXUS_ADMIN_PASS

RUN mvn  -f /app/pom.xml -s /usr/share/maven/ref/settings.xml clean deploy -Dmaven.test.skip=true
#-B -f

FROM openjdk:8-jre-alpine as runner

RUN addgroup -S devops && adduser -S devops -G devops

COPY --from=builder --chown=devops:devops /app/target/*.jar /opt/demo.jar

# RUN curl -u login:passwd -o junit-1.2.jar "nexus repository URL/junit-1.2.jar" -L
# RUN curl - u admin:$NEXUS_ADMIN_PASS     http://192.168.99.10:8081/repository/maven-snapshots/com/example/demo/0.0.1-SNAPSHOT/*.jar 

EXPOSE 8080:8080
USER devops


ENTRYPOINT ["java"]
CMD ["-jar","/opt/demo.jar"]
