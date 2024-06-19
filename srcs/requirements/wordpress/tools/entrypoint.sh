#!/bin/sh

wp core download --path=/var/www/html
cd /var/www/html
while [ ! -f /var/www/html/wp-config.php ]; do
	echo "doing while"
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --path=/var/www/html
	sleep 1
done

wp core install --url="https://$DOMAIN_NAME" --title="inception" --admin_user=$ADMIN_USER_NAME --admin_password=$ADMIN_USER_PASS --admin_email=mgn1440@gmail.com
wp user create $AUTHOR_USER_NAME --user_pass=$AUTHOR_USER_PASS author@example.com --role=author

php-fpm82 -F