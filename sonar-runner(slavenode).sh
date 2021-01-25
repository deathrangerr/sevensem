cd /home/ubuntu/
apt install unzip -y
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip 
cd  sonar-scanner-4.2.0.1873-linux/
sed -i '4 a sonar.host.url=#sonarmasterip:9000' conf/sonar-scanner.properties 
sed -i '$ a /home/ubuntu/sonar-scanner-4.2.0.1873-linux/bin' /etc/environment


##example jenkins pipeline script
#node{
#stage('cloning')
#git'https://github.com/deathrangerr/CloudenabledWebApp.git'

#stage('compile')
#sh'mvn compile'

#stage('sonar analysis')
#sh 'mvn sonar:sonar   -Dsonar.projectKey=sevensem   -Dsonar.host.url=http://3.236.208.208:9000   -Dsonar.login=f55b6c2ddc588fa572bc61647b5f80a4472e3867'


#stage('test')
#sh'mvn test'

#stage('package')
#sh'mvn package'

#stage('copying')
#sh'sudo cp target/CloudenabledWebApp.war /var/lib/tomcat7/webapps/'
#}




