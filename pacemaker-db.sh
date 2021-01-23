#!/bin/bash

#Install the Pacemaker Packages on ALL the Database Nodes
sudo yum install -y pcs pacemaker corosync fence-agents-all resource-agents -y

#Enable and Start the pcsd, pacemaker service on ALL the Database Nodes
systemctl enable pcsd
systemctl start pcsd

#Assign the Password for hacluster user on ALL the Database Nodes(Give same password for all the nodes)
passwd hacluster
##root1234

#Destroy Cluster on ALL the Database Nodes
pcs cluster destroy

#Run Pacemaker Cluster Authentication on Database Node 01
pcs cluster auth mysql01 mysql02 -u hacluster

#Setup the Clusteron Database Node 01
pcs cluster setup –name dbcluster mysql01 mysql02 

#Enable and Start on Database Node 01
pcs cluster enable--all
pcs cluster start--all

#False the STONITH on Database Node 01
pcs property set stonith-enabled=false 

#Ignore the quorum on Database Node 01
pcs property set no-quorum-policy=ignore

#Enable and Start Coro sync service on Database Node 01
systemctl enable corosync.service && systemctl start corosync.service

#Create the VIRTUAL IP on Database Node 01
pcs resource create DBCluster_VIP ocf:heartbeat:IPaddr2 ip=192.168.29.120 cidr_netmask=24 op monitor interval=20s

#check status
pcs status
sleep 10s

#Set Stick Value on Database Node 01
pcs resource defaults resource-stickiness=INFINITY
