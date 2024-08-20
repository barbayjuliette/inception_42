echo "start.sh"


	# sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	#chown -R www-data:www-data /var/www/*;
	#chown -R 755 /var/www/*;
	#mkdir -p /run/php/;
	#touch /run/php/php7.4-fpm.pid;
sleep 10
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	echo "Downloading WP-CLI"
	mkdir -p /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	#cd /var/www/html;


	echo "Setting up Wordpress..."
	wp core download --path=/var/www/wordpress --allow-root;

	echo "Creating wp-config.php"
	# mv /var/www/wp-config.php /var/www/html
	wp config create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --path=/var/www/wordpress --allow-root
	wp core config --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root

	echo "Wordpress setting up DB"
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

	echo "Wordpress: Creating users..."
	echo "WP_USER_LOGIN: ${WP_USER_LOGIN}"
	#wp user create --allow-root ${DB_USER} ${DB_EMAIL} --user_pass=${DB_PASSWORD};
	echo "Wordpress: set up!"
fi

#exec "$@"
echo "Starting PHP-FPM..."
/usr/sbin/php-fpm8.2 --nodaemonize
