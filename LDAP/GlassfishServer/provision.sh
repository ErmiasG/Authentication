#!/bin/bash
set -eux
echo "Install Glassfish server"

sudo apt-get update  > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1

sudo apt install ldap-utils -y > /dev/null 2>&1

echo "Testing ldapsearch"
ldapsearch -x -LLL -H ldap://ldap.example.com:389 -b dc=example,dc=com "(uid=ermias)" memberof

sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1
sudo apt-get install unzip -y > /dev/null 2>&1

unzip /vagrant/GlassfishServer/payara-4.1.2.181.zip > /dev/null 2>&1

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

payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile create-jndi-resource \
 --restype javax.naming.ldap.LdapContext \
 --factoryclass com.sun.jndi.ldap.LdapCtxFactory \
 --jndilookupname dc\=example\,dc\=com \
 --property java.naming.provider.url=ldap\\://ldap\.example\.com\\:389:java.naming.ldap.attributes.binary=entryUUID:SECURITY_AUTHENTICATION=none:REFERRAL=follow ldap/LdapResource

payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile restart-domain domain1

sudo apt install maven -y > /dev/null 2>&1

mvn clean install -f /vagrant/GlassfishServer/example/pom.xml > /dev/null 2>&1

payara41/glassfish/bin/asadmin --user admin --passwordfile=payara41/glassfish/domains/domain1/config/pwdfile deploy /vagrant/GlassfishServer/example/target/ldap-0.1.war
