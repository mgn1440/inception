# MariaDB on Alpine Linux
FROM alpine:3.18

# MariaDB server and client
RUN apk update && apk add mariadb mariadb-client

# set environment variables
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# import files into container
COPY ./conf/ /etc/mysql/
COPY ./tools/ /usr/bin/local/

RUN chmod +x /usr/bin/local/entrypoint.sh

ENTRYPOINT ["usr/bin/local/entrypoint.sh"]

EXPOSE 3306