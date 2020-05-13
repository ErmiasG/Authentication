#!/bin/bash
set -eux
echo "Create Payara Server"

RESOURCES=/vagrant/Client

sudo apt-get update > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1
sudo apt-get install unzip

sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1

unzip ${RESOURCES}/payara-5.184.zip > /dev/null 2>&1

sudo chown vagrant:vagrant -R payara5/

cp ${RESOURCES}/mysql-connector-java-5.1.47.jar payara5/glassfish/lib

cat >> payara5/glassfish/domains/domain1/config/tmpfile <<EOF
AS_ADMIN_PASSWORD=
AS_ADMIN_NEWPASSWORD=adminpw
EOF

cat >> payara5/glassfish/domains/domain1/config/pwdfile <<EOF
AS_ADMIN_PASSWORD=adminpw
EOF

payara5/glassfish/bin/asadmin start-domain domain1

payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/tmpfile change-admin-password
payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile enable-secure-admin

payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile stop-domain domain1
payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile start-domain domain1

export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password kthfs"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password kthfs"

sudo apt-get install -y mysql-server-5.7
mysql -u root -pkthfs -e "SET @@global.sql_mode ='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'"

mysql -u root -pkthfs -e "CREATE DATABASE oauth;"
mysql -u root -pkthfs oauth < ${RESOURCES}/tables.sql
mysql -u root -pkthfs oauth < ${RESOURCES}/data.sql

mysql -u root -pkthfs -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by 'kthfs';"
mysql -u root -pkthfs -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by 'kthfs';"
mysql -u root -pkthfs -e "FLUSH PRIVILEGES;"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

payara5/glassfish/bin/asadmin --user admin --passwordfile payara5/glassfish/domains/domain1/config/pwdfile create-jdbc-connection-pool \
--datasourceclassname=com.mysql.jdbc.jdbc2.optional.MysqlDataSource \
--restype=javax.sql.DataSource \
--property="User=root:Password=kthfs:URL=jdbc\:mysql\:\/\/localhost\:3306\/oauth" \
oauth_pool

payara5/glassfish/bin/asadmin --user admin --passwordfile payara5/glassfish/domains/domain1/config/pwdfile create-jdbc-resource \
--connectionpoolid oauth_pool jdbc/oauth

payara5/glassfish/bin/asadmin --user admin --passwordfile payara5/glassfish/domains/domain1/config/pwdfile create-auth-realm \
--classname=com.sun.enterprise.security.auth.realm.jdbc.JDBCRealm \
--property=jaas-context=jdbcRealm:datasource-jndi=jdbc/oauth:user-table=Person:user-name-column=email:password-column=password:group-table=Groups:group-table-user-name-column=name:group-name-column=name:assign-groups=USERS,ADMINS:digest-algorithm=MD5 \
jdbcRealm

payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile stop-domain domain1
payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile start-domain domain1

#payara5/glassfish/bin/asadmin --user admin --passwordfile=payara5/glassfish/domains/domain1/config/pwdfile deploy ${RESOURCES}/hopsworks
