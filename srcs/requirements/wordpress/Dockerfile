FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y php-fpm curl php-mysqli default-mysql-client

RUN mkdir -p /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -zxvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress/* /var/www/html/ && \
	rmdir wordpress && \
	chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./conf/wordpress-conf.sh /var/www/wordpress-conf.sh

RUN chmod +x /var/www/wordpress-conf.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/wordpress-conf.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "-F"]
