Multistage Dockerfile that build Spring Boot java application
==========

* Multistage dockerfile to build of SpringBoot helloworld app 
* 1st stage - Maven build with Nexus proxy repo
* 2nd stage - Alpine JRE 8 app launch
* Auto-provision Nexus Repositories for Maven 
* pass nexus credentials through environment variable 