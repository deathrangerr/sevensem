cd /home/ubuntu/
apt install unzip -y
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip 
cd  sonar-scanner-4.2.0.1873-linux/
sed -i '4 a sonar.host.url=sonarmasterip' conf/sonar-scanner.properties 
sed -i '$ a /home/ubuntu/sonar-scanner-4.2.0.1873-linux/bin' vim /etc/environment


#pipeline script jenkins
#stage('sonar analysis')
#sh 'mvn sonar:sonar -Dsonar.projectKey=cloudenabled -Dsonar.host.url=http://ipofmaster  -Dsonar.login=2a9f3e6d25311a992f4798d0e3280590c238f914'

