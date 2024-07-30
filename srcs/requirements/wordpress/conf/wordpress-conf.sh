#!/bin/bash

#  Immediately exit if any command within the script fails
set -e

echo "IN SCRIPT"

# curl -O https://wordpress.org/latest.tar.gz && \
# tar -zxvf latest.tar.gz && \
# rm latest.tar.gz && \
# mv wordpress/* /var/www/html/ && \
# rmdir wordpress && \
# chown -R www-data:www-data /var/www/html && \
# chmod -R 755 /var/www/html

# echo "Hello"

if [ ! -f /var/www/html/wp-config.php ]; then
  wp core download --allow-root
  echo "INSTALLING"
#   wp config create --dbname="${DB_DATABASE}" --dbuser="${DB_USERNAME}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}" --allow-root
#   wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_N}" --admin_password="${WP_ADMIN_P}" --admin_email="${WP_ADMIN_E}" --allow-root
#   wp user create "${WP_U_NAME}" "${WP_U_EMAIL}" --user_pass="${WP_U_PASS}" --role="${WP_U_ROLE}" --allow-root
fi