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
