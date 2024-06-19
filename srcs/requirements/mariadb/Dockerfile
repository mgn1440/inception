# MariaDB on Alpine Linux
FROM alpine:3.19

# MariaDB server and client
RUN apk update && apk add mariadb mariadb-client
RUN apk add --no-cache openrc

# import files into container
COPY ./conf/my.cnf /etc/mysql/
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/
COPY ./tools/ /usr/bin/local/

# RUN chmod 777 /var/lib/mysql
RUN chmod 644 /etc/mysql/my.cnf
RUN chmod 644 /etc/my.cnf.d/mariadb-server.cnf
RUN chmod +x /usr/bin/local/entrypoint.sh

ENTRYPOINT ["usr/bin/local/entrypoint.sh"]

EXPOSE 3306