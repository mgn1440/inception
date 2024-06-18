#!/bin/sh

echo "1"
wp core download --path=/var/www/html
echo "2"
cd /var/www/html
echo "3"
while [ ! -f /var/www/html/wp-config.php ]; do
	echo "doing while"
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --path=/var/www/html
	sleep 1
done

echo "4"
wp core install --url="https://yeonwkan.42.fr" --title="WP-CLI" --admin_user=yeonwkan --admin_password=yeonwkan --admin_email=mgn1440@gmail.com
echo "5"
wp user create author author@example.com --role=author
echo "6"

php-fpm81 -F
