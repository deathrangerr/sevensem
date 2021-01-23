#!/bin/bash

#add the repo for mariadb
touch /etc/yum.repos.d/mariadb.repo
sudo sh -c 'echo "[mariadb]" > /etc/yum.repos.d/mariadb.repo'

sudo sed -i '2 a name = MariaDB \nbaseurl = http://yum.mariadb.org/10.0/rhel7-amd64/ \ngpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB \ngpgcheck = 1' /etc/yum.repos.d/mariadb.repo

#installing mariadb and gallera
yum install MariaDB-Galera-server MariaDB-client galera socatrsync -y

#restart mysql
systemctl start mysql
systemctl enable mysql
systemctl status mysql

#secure mysql
mysql_secure_installation

####NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
#      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

#In order to log into MariaDB to secure it, we'll need the current
#password for the root user.  If you've just installed MariaDB, and
#you haven't set the root password yet, the password will be blank,
#so you should just press enter here.

#Enter current password for root (enter for none):
#OK, successfully used password, moving on...

#Setting the root password ensures that nobody can log into the MariaDB
#root user without the proper authorisation.

#Set root password? [Y/n] y
#New password:
#Re-enter new password:
#Password updated successfully!
#Reloading privilege tables..
# ... Success!


#By default, a MariaDB installation has an anonymous user, allowing anyone
#to log into MariaDB without having to have a user account created for
#them.  This is intended only for testing, and to make the installation
#go a bit smoother.  You should remove them before moving into a
#production environment.

#Remove anonymous users? [Y/n] y
# ... Success!

#Normally, root should only be allowed to connect from 'localhost'.  This
#ensures that someone cannot guess at the root password from the network.

#Disallow root login remotely? [Y/n] n
# ... skipping.

#By default, MariaDB comes with a database named 'test' that anyone can
#access.  This is also intended only for testing, and should be removed
#before moving into a production environment.

#Remove test database and access to it? [Y/n] y
# - Dropping test database...
# ... Success!
# - Removing privileges on test database...
# ... Success!

#Reloading the privilege tables will ensure that all changes made so far
#will take effect immediately.

#Reload privilege tables now? [Y/n] y
# ... Success!

#Cleaning up...

# All done!  If you've completed all of the above steps, your MariaDB
#installation should now be secure.

#Thanks for using MariaDB!

#Login to mysql

#####mysql -u root -p

#####grant all privileges on *.* to root@'%' identified by 'root1234' with grant option;
#####grant all privileges on *.* to sst_user@'%' identified by 'root1234' with grant option;
#####FLUSH PRIVILEGES;
######quit;

#####service mysql stop

#Configure mysql
#[mysqld]
#open_files_limit = 8192
#max_connections = 10000

#[galera]
#binlog_format=ROW
#default-storage-engine=innodb
#innodb_autoinc_lock_mode=2
#innodb_locks_unsafe_for_binlog=1
#query_cache_size=0
#query_cache_type=0
#bind-address=0.0.0.0
#datadir=/var/lib/mysql
#innodb_log_file_size=100M
#innodb_file_per_table
#innodb_flush_log_at_trx_commit=2
#wsrep_provider=/usr/lib64/galera/libgalera_smm.so
#wsrep_cluster_address="gcomm://192.168.0.121,192.168.0.122,192.168.0.123"
#wsrep_cluster_name='galera_cluster'
#wsrep_node_address='192.168.0.121'
#wsrep_node_name='mysql01'
#wsrep_sst_method=rsync
#wsrep_sst_auth=sst_user:root1234

#Start mysql
#/etc/init.d/mysql start --wsrep-new-cluster
#mysql -u root -p -e"show status like 'wsrep%'"



