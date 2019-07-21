# spring-boot-helloworld

Spring-boot, Jax-RS, Openshift

## Add Application to Openshift

*oc new-app registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest~https://github.com/wus/spring-boot-helloworld --build-env='ARTIFACT_DIR=rest/target' --build-env='JAVA_APP_JAR=spring-boot-helloworld-rest.jar'*

## Enable Route
*oc expose svc/spring-boot-helloworld*

## Call the Service
*https://<openshift_service_host>/openshift/rest/hello?name=test*


