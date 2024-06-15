#!/bin/sh

wp core download --path=/var/www/html
while [! /var/www/html/wp-config.php ]; do
	wp core config --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --path=/var/www/html
done

php-fpm7 -f