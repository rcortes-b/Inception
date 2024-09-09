#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$MDB_NAME --dbuser=$MDB_USER --dbpass=$MDB_PASS --dbhost=$MDB_HOST --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADM_USER --admin_password=$WP_ADM_PASSWD --admin_email=$WP_ADM_EMAIL --allow-root

php-fpm8.2 -F
