#!/bin/bash
set -eux

sudo apt update > /dev/null 2>&1
sudo apt upgrade -y > /dev/null 2>&1

sudo apt install openjdk-8-jdk -y > /dev/null 2>&1
sudo apt install maven -y > /dev/null 2>&1

export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password kthfs"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password kthfs"
sudo apt-get install -y mysql-server-5.7

mysql -u root -pkthfs -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by 'kthfs';"
mysql -u root -pkthfs -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'kthfs';"

mysql -u root -pkthfs -e "CREATE DATABASE oic; GRANT ALL PRIVILEGES ON oic.* TO 'oic'@'localhost' IDENTIFIED BY 'oic'; GRANT ALL PRIVILEGES ON oic.* TO 'oic'@'%' IDENTIFIED BY 'oic';"

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# cd  /vagrant/Auth_Server/OpenID-Connect-Java-Spring-Server/openid-connect-server-webapp/
# mvn jetty:run-war