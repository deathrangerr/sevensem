#!/bin/bash

#For Centos

#updating the OS
sudo yum update -y

#installing NTP and Chrony for network sync
sudo yum install chrony vim -y

#starting the NTP service and configure it to start when system boosts
sudo systemctl enable chronyd.service
sudo systemctl start chronyd.service

#editing chrony conf with ha's ip
sed -i '1 a server 192.168.0.131  iburst \nserver 192.168.0.131 iburst' /etc/chrony.conf

#resatrt chrony service
sudo systemctl restart chronyd.service

#enabling yum priorities
sudo yum -y install yum-plugin-priorities

#Setting the selinux configuration to permissive & Stoping, Disabling the firewalld and networkmanager service
sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config
sudo setenforce 0
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager

#making entry in /etc/hosts
sed -i '$ a 192.168.0.110     haproxyvip.example.com    haproxyvip \n192.168.0.111     haproxy01.example.com     haproxy01 \n192.168.0.112     haproxy02.example.com     haproxy02' /etc/hosts

#Making host name entry
sudo hostnamectl set-hostname haproxy01
hostname --fqdn

#editing ens33 interface file
sudo sh -c 'echo "TYPE=\"Ethernet\"" > /etc/sysconfig/network-scripts/ifcfg-ens33'
sed -i '1 a PROXY_METHOD="none" \nBROWSER_ONLY="no" \nBOOTPROTO="static" \nIPADDR="192.168.0.111" \nPREFIX="24" \nGATEWAY="192.168.0.1" \nDNS1="8.8.8.8" \nDNS2="192.168.0.1" \nDEFROUTE="yes" \nIPV4_FAILURE_FATAL="no" \nNAME="ens33" \nDEVICE="ens33" \nONBOOT="yes"' /etc/sysconfig/network-scripts/ifcfg-ens33

#restarting the proxy server
echo "restarting the server"
sleep 10s

init 6
