#!/bin/bash
set -eux
echo "Install OpenLDAP"

RESOURCE="/vagrant/LDAPServer/Resource"
config_admin_password=ldap-admin

debconf-set-selections <<EOF
slapd slapd/password1 password $config_admin_password
slapd slapd/password2 password $config_admin_password
EOF

sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y --no-install-recommends slapd ldap-utils

sudo ldapadd -Q -Y EXTERNAL -H ldapi:/// -f ${RESOURCE}/config.ldif

mkdir /tmp/ldif_output

slapcat -f ${RESOURCE}/schema_convert.conf -F /tmp/ldif_output -n0 -s "cn={5}dyngroup,cn=schema,cn=config" > /tmp/cn=dyngroup.ldif

sed -i '/structuralObjectClass: olcSchemaConfig/Q' /tmp/cn\=dyngroup.ldif

sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /tmp/cn\=dyngroup.ldif

sudo ldapadd -Y EXTERNAL -H ldapi:/// -v -f ${RESOURCE}/dbconfig.ldif

sudo ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f ${RESOURCE}/load_modules.ldif

sudo ldapadd -Q -Y EXTERNAL -H ldapi:/// -f ${RESOURCE}/add_modules.ldif

ldapadd -x -D cn=admin,dc=example,dc=com -w $config_admin_password  -f ${RESOURCE}/add_content.ldif
