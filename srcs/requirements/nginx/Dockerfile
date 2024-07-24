FROM debian:bullseye

# Update package manager
#  By default, Docker run as root: sudo is not needed
#  apt update it'll figure out what the latest version of each package and dependency is, but will not actually download or install any of those updates.
# The sudo apt-get upgrade command downloads and installs the updates for each outdated package and dependency on your system.
RUN apt-get update && apt-get upgrade --yes && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl

# Create private key and certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/inception.key \
    -out /etc/ssl/certs/inception.crt \
    -subj "/C=SG/L=Singapore/O=42Singapore/OU=student/CN=jbarbay.42.fr"

# req -x509L To generate a certificate. The option tells it to create self signed certificate
# -nodes : to not encrypt the key wioth passphrase. Usually neede in production
# newkey rsa:2048: create new key using RSA and size 2048 bits
# -subj: subject of the certificate. WHo it is for, what it is used for...

# After this, a self-signed SSL/TLS certificate and private key will be generated and stored in the specified files
# I can then use these files to configure an NGINX server to use SSL?TLS encrytion. 
# We do that in the nginx.conf file

# Copy NGINX configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Create wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data (default user and group for nginx)
RUN chown -R www-data:www-data /var/www/wordpress

# EXPOSE 80
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
