FROM ubuntu:22.04

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y apache2 openjdk-11-jdk wget tar && \
    apt-get clean

ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.50/bin/apache-tomcat-10.1.50.tar.gz /opt/

RUN tar -xvf apache-tomcat-10.1.50.tar.gz && \
    rm apache-tomcat-10.1.50.tar.gz

COPY index.html /var/www/html/index.html

EXPOSE 80 8080

CMD service apache2 start && /opt/apache-tomcat-10.1.50/bin/catalina.sh run
