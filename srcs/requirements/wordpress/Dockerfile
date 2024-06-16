# Use Alpine Linux as the base image
FROM alpine:3.14

# Install PHP-FPM
RUN apk update
RUN apk add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
php7-session php7-mbstring php7-gd curl
RUN apk add --no-cache openrc

# install wp-cli
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
