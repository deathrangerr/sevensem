#!/bin/bash
sudo apt update
sudo apt install wget git vim nano curl openjdk-8-jdk -y
git clone https://github.com/deathrangerr/CloudenabledWebApp.git
cd CloudenabledWebApp
mvn  compile
mvn test
mvn package

sed -i '$ a deb http://us.archive.ubuntu.com/ubuntu/ xenial main \ndeb http://us.archive.ubuntu.com/ubuntu/ xenial universe' /etc/apt/sources.list

sudo apt-get update
sudo apt-get install tomcat7

