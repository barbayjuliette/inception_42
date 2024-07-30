FROM debian:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y php-fpm curl php-mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /var/www/html

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/html/wp-config.php

COPY ./conf/wordpress-conf.sh /
RUN chmod +x wordpress-conf.sh

EXPOSE 9000

RUN /wordpress-conf.sh

CMD ["php-fpm8.2", "-F"]
