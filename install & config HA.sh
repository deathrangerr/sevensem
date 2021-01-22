#!/bin/bash

#Tell the kernel we'll be using IP's that are not defined in the interfaces file
sed -i '$ a net.ipv4.ip_nonlocal_bind=1' /etc/sysctl.conf
sysctl -p

#Install HAPROXY Keepalived
sudo yum install -y haproxy keepalived

#Configure the Keep alived
cp /etc/keepalived/keepalived.conf  /root/keepalived.conf.bkp
sed -i 'd' /etc/keepalived/keepalived.conf
sudo sh -c 'echo "global_defs {  > /etc/keepalived/keepalived.conf'
sed -i '2 a \n  router_id haproxy01\n} \nvrrp_script haproxy { \n  script "killall -0 haproxy" \n  interval 2 \n  weight 2 \n} \nvrrp_instance 50 { \n  virtual_router_id 50 \n  advert_int 1 \n priority 101 \n state MASTER \n interface ens33 \n  virtual_ipaddress { \n    192.168.0.110 dev ens33 \n  } \n track_script { \n    haproxy \n  } \n}' /etc/keepalived/keepalived.conf

#Start keepalived and Haproxy
sudo systemctl enable keepalived haproxy && systemctl start haproxy keepalived
