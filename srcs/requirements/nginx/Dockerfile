FROM debian:bullseye

RUN apt-get update && apt-get upgrade --yes && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/inception.key \
    -out /etc/ssl/certs/inception.crt \
    -subj "/C=SG/L=Singapore/O=42Singapore/OU=student/CN=jbarbay.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Create wordpress directory
# RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data (default user and group for nginx)
# RUN chown -R www-data:www-data /var/www/wordpress

# Testing
# COPY index.html /usr/share/nginx/html/index.html

EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
