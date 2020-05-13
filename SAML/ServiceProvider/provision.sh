#!/bin/bash
set -eux
echo "Install SP"

RESOURCE_PATH=/vagrant

sudo apt-get update  > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1

sudo apt install ldap-utils -y > /dev/null 2>&1

sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1
sudo apt-get install unzip -y > /dev/null 2>&1

unzip ${RESOURCE_PATH}/payara-4.1.2.181.zip > /dev/null 2>&1

cat >> payara41/glassfish/domains/domain1/config/tmpfile <<EOF
AS_ADMIN_PASSWORD=
AS_ADMIN_NEWPASSWORD=adminpw
EOF

cat >> payara41/glassfish/domains/domain1/config/pwdfile <<EOF
AS_ADMIN_PASSWORD=adminpw
EOF

payara41/glassfish/bin/asadmin start-domain domain1

payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/tmpfile change-admin-password
payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile enable-secure-admin

payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile stop-domain domain1
payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile start-domain domain1