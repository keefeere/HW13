FROM maven:latest
LABEL Description="Multistage dockerfile" Vendor="keefeere" Version="1.0"

COPY settings.xml /usr/share/maven/ref/
COPY ./app /app

RUN mvn -B -f /app/pom.xml -s /usr/share/maven/ref/settings-docker.xml clean deploy