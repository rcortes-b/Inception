#!/bin/bash

mysql_install_db

service mariadb start;

mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "CREATE DATABASE $MDB_NAME; FLUSH PRIVILEGES;"
mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "CREATE USER '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASS'; FLUSH PRIVILEGES;"
mysql -u $MDB_ROOT -p$MDB_ROOT_PASS -e "GRANT ALL ON $MDB_NAME.* TO '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASS' WITH GRANT OPTION; FLUSH PRIVILEGES;"

mysqldadmin -u $MDB_ROOT --password=$MDB_ROOT_PASS shutdown

mysqld
