#!/bin/bash
set -eux
echo "Hostname config"

cat >> /etc/hosts <<EOF
192.168.10.21  ldap.example.com ldap
192.168.10.22  server.example.com server
EOF