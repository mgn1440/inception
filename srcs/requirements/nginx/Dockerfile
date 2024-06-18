FROM alpine:3.19

# Install dependencies
RUN apk update && apk add --no-cache nginx openssl

# Configure nginx
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Generate self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=KR/ST=Seoul/L=GangnamGu/O=42Seoul/CN=yoenwkan.42.fr"

# Expose ports
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]