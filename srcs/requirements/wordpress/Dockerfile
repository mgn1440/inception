# Use Alpine Linux as the base image
FROM alpine:3.19

# Install PHP-FPM
RUN apk update
RUN apk add php81 php81-fpm php81-opcache php81-mysqli php81-pdo php81-pdo_mysql php81-mbstring php81-json php81-session php81-ctype php81-tokenizer php81-xml php81-simplexml php81-dom php81-curl php81-phar php81-iconv php81-fileinfo php81-openssl php81-zip
RUN apk add --no-cache openrc curl
RUN apk add --no-cache mariadb-client

# install wp-cli
RUN ln -sf /usr/bin/php81 /usr/bin/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy www.conf to the desired location
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./tools/ /usr/bin/local/

# Expose port 9000 for Nginx communication
EXPOSE 9000

ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
ENV WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ENV WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}

# Start PHP-FPM

RUN chmod +x /usr/bin/local/entrypoint.sh

ENTRYPOINT ["usr/bin/local/entrypoint.sh"]

# CMD ["php-fpm7", "-F"]
