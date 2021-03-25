#!/bin/bash


      # docker stop $(docker ps -a -q)
      # docker rm $(docker ps -a -q)
      # docker rmi -f $(docker images -q)

cd /vagrant/insta-nexus-master
sh ./go.sh
cd /vagrant

export NEXUS_ADMIN_PASS=`docker exec -i nexus cat /nexus-data/admin.password`

#Testing
#echo $NEXUS_ADMIN_PASS


 sudo userdel devops
 sudo useradd devops --shell=/bin/false -p '*'


  docker build --tag javabuildrunner --build-arg NEXUS_ADMIN_PASS=${NEXUS_ADMIN_PASS} /vagrant
  docker kill javabuildrunner 
  docker run -it --rm -d -p 8080:8080 --name javabuildrunner javabuildrunner
   ( docker logs -f javabuildrunner & ) | grep -q "welcomePageHandlerMapping"
   curl localhost:8080

