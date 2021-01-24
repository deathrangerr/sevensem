#!/bin/bash
sudo apt update
sudo apt install openjdk-8-jdk -y
sed -i '$ a deb http://us.archive.ubuntu.com/ubuntu/ xenial main \ndeb http://us.archive.ubuntu.com/ubuntu/ xenial universe' /etc/apt/sources.list
sudo apt update
sudo apt-get install tomcat7 -y

sleep 5s

####INSTALLING NECESSARY BASIC TOOL WITH JAVA####
sudo apt install wget git vim nano curl maven -y
####USING WGET COMMAND TO ADD JENKINS KEYS####
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
####ADDING JENKINS TOOL TO SOURCE FILE####
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
####UPDATING OS AND INSTALLING JENKINS####
apt update && apt-get install jenkins -y
####STARTING JENKINS AND ENABLING IT TO START AFTER SERVER RESTART
sudo systemctl start jenkins && sudo systemctl enable jenkins
####ADDING JENKINS TO SUDO GROUP####
sudo usermod -aG sudo jenkins
####ADDING JENKINS USER TO SUDOERS FILE##
sudo sed -i '26 a jenkins  ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
####CHANGING PORT OF JENKINS SERVER####
sed -i '63d' /etc/default/jenkins && sed -i '63 a HTTP_PORT=8090' /etc/default/jenkins
####RESTART JENKINS AND SHOW THE STATUS OF JENKINS####
systemctl restart jenkins && systemctl status jenkins

#####pipeline script copy and paste
#node{
#stage('cloning')
#git'https://github.com/deathrangerr/CloudenabledWebApp.git'

#stage('compile')
#sh'mvn compile'

#stage('test')
#sh'mvn test'

#stage('package')
#sh'mvn package'

#stage('copying')
#sh'sudo cp target/CloudenabledWebApp.war /var/lib/tomcat7/webapps/'

#stage('restarting tomact')
#sh'sudo systemctl restart tomcat7'

#}
