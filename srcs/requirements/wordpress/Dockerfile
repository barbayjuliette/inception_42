FROM debian:bookworm

#RUN apt-get update && apt-get upgrade -y \
#    && apt-get install -y php-fpm curl php-mysqli default-mysql-client \
#	apache2 \
#	ghostscript \
#	libapache2-mod-php \
#	php \
#	php-bcmath \
#	php-curl \
#	php-imagick \
#	php-intl \
#	php-json \
#	php-mbstring \
#	php-mysql \
#	php-xml \
#	php-zip
RUN apt-get update

RUN apt-get -y install php-mysqli php-fpm mariadb-client curl
RUN mkdir -p /var/www/wordpress

RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -zxvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress/* /var/www/wordpress/ && \
	rmdir wordpress && \
	chown -R www-data:www-data /var/www/wordpress && \
	chmod -R 755 /var/www/wordpress


COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
COPY ./conf/wordpress-conf.sh /var/www/wordpress-conf.sh
# COPY ./conf/wp-config.php /var/www/wp-config.php

RUN chmod +x /var/www/wordpress-conf.sh

EXPOSE 9000

WORKDIR /var/www/wordpress

COPY /tools/start.sh /
RUN chmod +x /start.sh
ENTRYPOINT [ "sh", "/start.sh" ]
# COPY ./conf/wp-config.php /var/www/html/wp-config.php


#ENTRYPOINT [ "/var/www/wordpress-conf.sh" ]

#CMD ["/usr/sbin/php-fpm7.4", "-F"]
