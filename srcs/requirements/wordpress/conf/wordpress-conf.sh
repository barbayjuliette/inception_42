#!/bin/bash

curl -O https://wordpress.org/latest.tar.gz && \
tar -zxvf latest.tar.gz && \
rm latest.tar.gz && \
mv wordpress/* /var/www/html/ && \
rmdir wordpress && \
chown -R www-data:www-data /var/www/html && \
chmod -R 755 /var/www/html

echo "Hello"
