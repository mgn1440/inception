#!/bin/sh

wp core download --path=/var/www/html
cd /var/www/html
while [ ! -f /var/www/html/wp-config.php ]; do
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --path=/var/www/html
	sleep 1
done

php-fpm7 -F