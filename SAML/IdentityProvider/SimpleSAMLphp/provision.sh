#!/bin/bash
set -eux
echo "Install IDP"

RESOURCE_PATH=/vagrant

sudo apt-get update  > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1

sudo apt install curl -y > /dev/null 2>&1

sudo apt-get install apache2 -y > /dev/null 2>&1

sudo apt-get install php libapache2-mod-php -y > /dev/null 2>&1
sudo apt-get install php-curl -y > /dev/null 2>&1

wget -O simplesamlphp.tar.gz https://simplesamlphp.org/download?latest

tar -xvzf simplesamlphp.tar.gz
ln -s simplesamlphp-* simplesamlphp

cd simplesamlphp
touch modules/exampleauth/enable

cp ${RESOURCE_PATH}/config.php config/config.php
cp ${RESOURCE_PATH}/authsources.php config/authsources.php

openssl req -newkey rsa:3072 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem -subj "/C=SE/ST=Stockholm/L=Kista/O=hopsworks/OU=IT Department/CN=ssl.hopsworks.ai"

sudo chown :www-data cert/example.org.pem
sudo chmod g+r cert/example.org.pem

cp ${RESOURCE_PATH}/saml20-idp-hosted.php metadata/saml20-idp-hosted.php
cp ${RESOURCE_PATH}/saml20-sp-remote.php metadata/saml20-sp-remote.php

sudo cat ${RESOURCE_PATH}/000-default.conf /etc/apache2/sites-enabled/000-default.conf

sudo systemctl restart apache2

