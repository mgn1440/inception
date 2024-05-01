# MariaDB on Alpine Linux
FROM alpine:3.18

# MariaDB server and client
RUN apk update && apk add mariadb mariadb-client # this is not executed by mariadb package
RUN mysql_install_db --user=mysql --basedir=/usr

# make life easier
ENV TERM xterm

# import files into container
COPY ./conf/ /etc/mysql/
#COPY scripts/* /opt/mysql/

# last optimizations are done against the running daemon via SQL
#RUN /opt/mysql/prepare-db

# other applications need to backup/analyze data and logs
# VOLUME /var/lib/mysql
# VOLUME /var/log/mysql

# create and make available a directory for backups
# RUN mkdir -p /var/backups/mysql
# RUN chmod a+r /var/backups/mysql/
# VOLUME /var/backups/mysql

# demonize
ENTRYPOINT ["mysqld_safe"]

# MariaDB port
EXPOSE 3306

# # Keep MariaDB running
# CMD ["mysqld"]
