#!/bin/bash
sudo apt update

#sudo apt-get update
sudo apt-get install tomcat7 -y
sleep 5s

cp /home/ubuntu/sevensem/CloudenabledWebApp/target/CloudenabledWebApp.war /var/lib/tomcat7/webapps/

sudo apt install wget git vim nano curl openjdk-8-jdk maven -y 
git clone https://github.com/deathrangerr/CloudenabledWebApp.git
cd CloudenabledWebApp
mvn compile
mvn test
mvn package

sed -i '$ a deb http://us.archive.ubuntu.com/ubuntu/ xenial main \ndeb http://us.archive.ubuntu.com/ubuntu/ xenial universe' /etc/apt/sources.list


systemctl restart tomcat7



###visit public ip of ur instance with port 8080 and project name

###eg:13.24.1.98:8080/CloudenabledWebApp

