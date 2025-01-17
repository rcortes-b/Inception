#!/bin/bash

mysql_install_db
#mariadb-install-db

service mariadb start;

if [ -d "/var/lib/mysql/$MDB_NAME" ]

then
	
	echo "Database already exists!"

else

mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "CREATE DATABASE $MDB_NAME; FLUSH PRIVILEGES;"
mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "CREATE USER '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASS'; FLUSH PRIVILEGES;"
mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "GRANT ALL ON $MDB_NAME.* TO '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASS' WITH GRANT OPTION; FLUSH PRIVILEGES;"

fi

mysqladmin -u $MDB_ROOT --password=$MDB_ROOT_PASS shutdown

mysqld
