#!/bin/sh

openrc default
touch /run/openrc/softlevel
/etc/init.d/mariadb setup

# rc-service mariadb start

/usr/bin/mariadbd-safe --datadir='/var/lib/mysql' &

echo "db start"
while ! mysqladmin ping -h localhost --silent; do
    sleep 1
done
echo "db started"

echo "setting start"
mysql -u root -e "CREATE DATABASE $WORDPRESS_DB_NAME;"
mysql -u root -e "CREATE USER '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -u root -e "GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"
echo "setting done"

# rc-service mariadb stop

mysqladmin -u root shutdown

/usr/bin/mariadbd-safe --datadir='/var/lib/mysql'