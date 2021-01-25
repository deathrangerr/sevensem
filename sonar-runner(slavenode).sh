cd /home/ubuntu/
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip 
cd  sonar-scanner-4.2.0.1873-linux/
sed -i '/ssonar.host.url=sonarmasterip' conf/sonar-scanner.properties 
sed -i '$ a /home/ubuntu/sonar-scanner-4.2.0.1873-linux/bin' /home/ubuntu/sonar-scanner-4.2.0.1873-linux/bin
