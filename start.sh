#!/bin/bash


 docker stop $(docker ps -a -q)
 docker rm $(docker ps -a -q)
 docker rmi $(docker images -q)

sh ./insta-nexus-master/go.sh

docker build -t java.builder /vagrant
# docker run -it --rm --name java.builder -v "$(pwd)/app":/app -w /app java.builder mvn clean install