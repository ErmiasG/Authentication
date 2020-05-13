#!/bin/bash
set -eux
echo "Hostname config"
source /vagrant/common.env

cat >> /etc/hosts <<EOF
192.168.56.10  $KERBEROS_FQDN
192.168.56.22  $SERVER
192.168.56.11  $CLIENT
EOF
