#!/bin/bash
#install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
sudo yum install -y java
sudo service jenkins start
sudo chkconfig jenkins on
cmd=$(sudo rpm -q openssh 2>/dev/null)
  if [ $? == 1 ]
    then
      sudo yum -y install openssh-server openssh-clients;
  fi
sudo service sshd start
sudo chkconfig sshd