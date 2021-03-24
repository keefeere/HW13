FROM maven:latest
LABEL Description="Multistage dockerfile" Vendor="keefeere" Version="1.0"


ARG NEXUS_ADMIN_PASS
ENV NEXUS_ADMIN_PASS=$NEXUS_ADMIN_PASS

COPY settings.xml /usr/share/maven/ref/
COPY ./app /app

RUN echo Admin pass $NEXUS_ADMIN_PASS

RUN mvn  -f /app/pom.xml -s /usr/share/maven/ref/settings.xml clean deploy -Dmaven.test.skip=true
#-B -f

FROM openjdk:8-jre-alpine