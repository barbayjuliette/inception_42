#! /bin/bash
	chown -R www-data:www-data /var/www/*;
	chmod -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.4-fpm.pid;

	echo "Waiting for MariaDB to be available..."
	while ! mysqladmin ping -h"$DB_HOST" --silent; do
  		sleep 1
	done

if [ ! -f /var/www/html/wp-config.php ]; then

	echo "Downloading WP-CLI"
	mkdir -p /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;

	cp var/www/html/wp-config-sample.php var/www/html/wp-config.php

	sed -i 's/database_name_here/'"$DB_NAME"'/g' var/www/html/wp-config.php
	sed -i 's/localhost/'"$DB_HOST"'/g' var/www/html/wp-config.php
	sed -i 's/username_here/'"$DB_USER"'/g' var/www/html/wp-config.php
	sed -i 's/password_here/'"$DB_PASSWORD"'/g' var/www/html/wp-config.php

	sleep 5

	echo "Wordpress setting up DB"
	wp core install --path=/var/www/html --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email

	echo "Wordpress: Creating users..."
	wp user create --path=/var/www/html --allow-root ${DB_USER} ${DB_EMAIL} --user_pass=${DB_PASSWORD} --role=author;
	echo "Wordpress: set up!"
fi

exec "$@"
