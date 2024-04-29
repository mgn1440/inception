FROM alpine:3.18

# Install dependencies
RUN apk update && apk add --no-cache nginx openssl

# Configure nginx
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Generate self-signed SSL certificate
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# Expose ports
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]