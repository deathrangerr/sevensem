#!/bin/bash
sudo apt update

sudo apt install  openjdk-8-jdk -y
sed -i '$ a deb http://us.archive.ubuntu.com/ubuntu/ xenial main \ndeb http://us.archive.ubuntu.com/ubuntu/ xenial universe' /etc/apt/sources.list
sudo apt update
sudo apt-get install tomcat7 -y

sleep 5s


sudo apt install wget git vim nano curl maven -y 
git clone https://github.com/deathrangerr/CloudenabledWebApp.git
cd CloudenabledWebApp
mvn compile
mvn test
mvn package


cp /home/ubuntu/sevensem/CloudenabledWebApp/target/CloudenabledWebApp.war /var/lib/tomcat7/webapps/


systemctl restart tomcat7



###visit public ip of ur instance with port 8080 and project name

###eg:13.24.1.98:8080/CloudenabledWebApp

