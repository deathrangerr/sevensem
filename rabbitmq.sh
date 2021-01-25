#!/bin/bash
#add the repo for mariadb
yum -y install yum-plugin-priorities
yum -y install centos-release-openstack-rocky
yum -n update
yum install python-openstackclient -y
yum install openstack-selinux -y

sed -i 's/enforcing/permissive/g' /etc/selinux/config

setenforce 0

systemctl stop firewalld
systemctl disable firewalld
systemctl stop NetworkManager
systemctl disable NetworkManager

touch /etc/yum.repos.d/mariadb.repo
sudo sh -c 'echo "[mariadb]" > /etc/yum.repos.d/mariadb.repo'

sudo sed -i '1 a name = MariaDB \nbaseurl = http://yum.mariadb.org/10.0/rhel7-amd64/ \ngpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB \ngpgcheck = 1' /etc/yum.repos.d/mariadb.repo

#Install MariaDB
yum install MariaDB-client -y

#login
#mysql -h mysqlvip -u root -p

#Install, Enable and Start RabbitMQ (Message Queue) enable and start service
yum -y install rabbitmq-server	
systemctl enable rabbitmq-server.service
systemctl start rabbitmq-server.service

