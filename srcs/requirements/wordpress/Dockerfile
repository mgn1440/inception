# Use Alpine Linux as the base image
FROM alpine:3.19

# Install PHP-FPM
RUN apk update
RUN apk add php php-fpm php-opcache php-mysqli php-pdo php-pdo_mysql php-mbstring php-json php-session php-ctype php-tokenizer php-xml php-simplexml php-dom php-curl php-phar php-iconv php-fileinfo php-openssl php-zip
RUN apk add --no-cache openrc curl
RUN apk add --no-cache mariadb-client

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy www.conf to the desired location
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY ./tools/ /usr/bin/local/

# Expose port 9000 for Nginx communication
EXPOSE 9000

# Start PHP-FPM
RUN chmod +x /usr/bin/local/entrypoint.sh

ENTRYPOINT ["usr/bin/local/entrypoint.sh"]

