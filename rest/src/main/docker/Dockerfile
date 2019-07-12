FROM openjdk:8-jdk-alpine
MAINTAINER Shan Wu <shan.wu@bertelsmann.de>

# Install SUPERVISOR
ENV SUPERVISOR_VERSION=3.3.1

RUN apk update 
RUN apk add --no-cache -u python py-pip
RUN pip install --upgrade pip
RUN pip install supervisor==$SUPERVISOR_VERSION

#ENV environment="development"
ENV app_base_name="tnd-export"

RUN apk add --no-cache openrc

# Configure SUPERVISOR
COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN sed -i "s/{{ environment }}/$environment/g" /etc/supervisor/supervisord.conf
RUN sed -i "s/{{ app_base_name }}/$app_base_name/g" /etc/supervisor/supervisord.conf
RUN mkdir -p /var/local/supervisor
RUN chmod 777 -R /var/local/supervisor

# System Timezone 
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo "Europe/Berlin" >  /etc/timezone

# OPENSSL
RUN apk add  --no-cache --update openssl

# Install Application
RUN mkdir -p /var/log/spring-boot
RUN chmod 777 -R /var/log/spring-boot
RUN mkdir /java-app
RUN mkdir /java-app/$app_base_name
RUN mkdir /java-app/$app_base_name/tomcat
RUN mkdir /java-app/$app_base_name/tomcat/logs
ADD $app_base_name-scheduler.jar /java-app/$app_base_name/$app_base_name-scheduler.jar
RUN sh -c 'touch /java-app/$app_base_name/$app_base_name-scheduler.jar'
RUN touch /java-app/$app_base_name/tomcat/logs/access_log.log
RUN chmod 777 -R /java-app

EXPOSE 8080

VOLUME ["/tmp"]

CMD ["/usr/bin/supervisord"]