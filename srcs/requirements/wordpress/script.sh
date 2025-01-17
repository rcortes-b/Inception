#!/bin/bash
cd /var/www/html

if [ -d ./wp-config.php ]

then

	echo "Wordpress is already installed!"

else

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="$MDB_NAME" --dbuser="$MDB_USER" --dbpass="$MDB_PASS" --dbhost="$MDB_HOST" --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADM_USER" --admin_password="$WP_ADM_PASSWD" --admin_email="$WP_ADM_EMAIL" --allow-root
./wp-cli.phar user create "$WP_USER" "$WP_USER_EMAIL" --role="$WP_USER_ROLE" --user_pass="$WP_USER_PASSWD" --allow-root
./wp-cli.phar theme activate twentytwentytwo --allow-root

fi

php-fpm8.2 -F
