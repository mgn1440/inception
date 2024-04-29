# Use Alpine Linux as the base image
FROM alpine:3.14

# Install PHP-FPM
RUN apk update && apk add --no-cache php7-fpm && apk add --no-cache openrc

# # Install WordPress
# RUN apk add --no-cache wordpress
# Copy www.conf to the desired location
# COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# Expose port 9000 for Nginx communication
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7", "-F"]
