# !/bin/bash



curl -O https://wordpress.org/latest.tar.gz && \
tar -zxvf latest.tar.gz && \
rm latest.tar.gz && \
mv wordpress/* /var/www/html/ && \
rmdir wordpress && \
chown -R www-data:www-data /var/www/html && \
chmod -R 755 /var/www/html
#check if wp-config.php exist

# Download and install WordPress
# wp core download --path=/var/www/html --allow-root

# # Install WordPress
# wp core install --path=/var/www/html --url=${WORDPRESS_URL} --title="${WORDPRESS_TITLE}" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${MYSQL_ROOT_PASSWORD} --allow-root

# # Create wp-config.php
# wp config create --path=/var/www/html --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

# # Ensure proper ownership and permissions
# chown -R www-data:www-data /var/www/html
# find /var/www/html -type d -exec chmod 755 {} \;
# find /var/www/html -type f -exec chmod 644 {} \;

# Start PHP-FPM
# exec "$@"
