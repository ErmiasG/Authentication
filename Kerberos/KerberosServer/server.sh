#!/bin/bash
set -eux
echo "Install MIT Kerberos server"

source /vagrant/common.env
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Stockholm /etc/localtime

cat krb5.conf > /etc/krb5.conf 

sed -i -e 's/${KERBEROS_FQDN}/'$KERBEROS_FQDN'/g' /etc/krb5.conf
sed -i -e 's/${DNS_ZONE}/'$DNS_ZONE'/g' /etc/krb5.conf
sed -i -e 's/${REALM}/'$REALM'/g' /etc/krb5.conf

sudo apt-get update  > /dev/null 2>&1
sudo apt-get -qqy install krb5-user libpam-krb5 libpam-ccreds auth-client-config 

HTTP_SERVER="HTTP/$SERVER@$REALM"

kinit $HTTP_SERVER -kt /vagrant/http_srv.keytab
