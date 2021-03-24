#!/bin/bash


   docker stop $(docker ps -a -q)
   docker rm $(docker ps -a -q)
   docker rmi $(docker images -q)

  sh /vagrant/insta-nexus-master/go.sh

export NEXUS_ADMIN_PASS=`docker exec -it nexus cat /nexus-data/admin.password`
echo $NEXUS_ADMIN_PASS


docker build -t java.builder --build-arg NEXUS_ADMIN_PASS=${NEXUS_ADMIN_PASS} /vagrant
