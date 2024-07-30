# !/bin/bash


# # downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. The -O flag tells curl to save the file with the same name as it has on the server.
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# # makes the WP-CLI PHAR file executable.
# chmod +x wp-cli.phar 

# # moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
# mv wp-cli.phar /usr/local/bin/wp

# # downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# # creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# # installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root


# # uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# # creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
# mkdir /run/php


# # curl -O https://wordpress.org/latest.tar.gz && \
# # tar -zxvf latest.tar.gz && \
# # rm latest.tar.gz && \
# # mv wordpress/* /var/www/html/ && \
# # rmdir wordpress && \
# chown -R www-data:www-data /var/www/html && \
# chmod -R 755 /var/www/html

# echo "Hello"


curl -O https://wordpress.org/latest.tar.gz && \
tar -zxvf latest.tar.gz && \
rm latest.tar.gz && \
mv wordpress/* /var/www/html/ && \
rmdir wordpress && \
chown -R www-data:www-data /var/www/html && \
chmod -R 755 /var/www/html
