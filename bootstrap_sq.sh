#!/bin/bash

######
# Bootstrap for a vagrant box running SonarQube.
# See http://www.sonarqube.org for more info.
######

####
# Update system package repository.
####

sudo apt-get update

####
# Install some packages.
####
export DEBIAN_FRONTEND=noninteractive
apt-get install -y -q emacs wget mysql-server apache2 unzip default-jdk nano telnet

####
# Download sonarqube.
####

SQFILE="sonarqube-5.1.zip"

if [ ! -e "/vagrant/$SQFILE" ]; then
    wget http://dist.sonar.codehaus.org/$SQFILE
    cp $SQFILE /vagrant/
else
    cp $SQFILE .
fi

####
# Configure mysql.
####

mysql -u root -e "create user 'sonarqube'@'%'"
mysql -u root -e "grant all on *.* to 'sonarqube'@'%'"
#mysql -u root -e "update user set password=PASSWORD('sonarqube') where User='sonarqube'"
