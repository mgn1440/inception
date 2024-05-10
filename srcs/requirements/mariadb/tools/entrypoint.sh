#!/bin/sh

adduser -D $WORDPRESS_DB_USER
mysql_install_db --user=$WORDPRESS_DB_USER --datadir=/var/lib/mysql
mysqld_safe