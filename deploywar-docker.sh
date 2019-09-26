#### this script will use after create package or war file ###############
rm -rf dockerjenkins-build
mkdir dockerjenkins-build
sudo chown jenkins:jenkins dockerjenkins-build
cd dockerjenkins-build
cp /var/lib/jenkins/workspace/QAPackage/target/addressbook.war .
touch Dockerfile
###EOF this menas read the dockerfile at the end of file#####
cat<EOF> Dockerfile
FROM tomcat7
ADD addressbook.war /usr/local/tomcat/webapps
CMD ["catlina.sh","run"]
EXPOSE 8080
EOT

sudo docker build -t jenkinstomcat:$BUILD_NUMBER .
sudo docker run -itd --name mycontainer.$BUILD_NUMBER -P jenkinstomcat:$BUILD_NUMBER
#in the above run we have used capital P so it will take random port else we can use small port for particular port
#sudo docker run -itd --name mycontainer.$BUILD_NUMBER -p 9090:8080 jenkinstomcat:$BUILD_NUMBER
