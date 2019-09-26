FROM tomcat:7
MAINTAINER chamankaushal@gmail.com
ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
