#!/bin/bash
#Install Jankins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
sudo yum -y install java
#install Apache
sudo yum -y install httpd
#Start services
sudo service jenkins start
sudo service httpd start
sudo chkconfig jenkins on

##Configure jenkins via apache
#Add virtual host to config via proxy
sudo cat /vagrant/virtualhost >> /etc/httpd/conf/httpd.conf
#Add prefix to jenkins config /etc/sysconfig/jenkins
sudo sed -i 's/JENKINS_ARGS=""/JENKINS_ARGS="--prefix=\/jenkins"/' /etc/sysconfig/jenkins
#restart servises
sudo service jenkins restart
sudo service httpd restart
