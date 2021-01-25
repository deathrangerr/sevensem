#!/bin/bash
sudo apt update
sudo apt-get docker.io -y
docker run -d --name sonarqube -p 9000:9000 sonarqube 
