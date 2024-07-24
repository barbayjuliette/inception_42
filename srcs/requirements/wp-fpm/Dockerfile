FROM debian:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y curl php-fpm php-mysql default-mysql-client

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/wordpress-conf.sh .

RUN chmod +x wordpress-conf.sh

CMD [ "./wordpress-conf.sh" ]


# COPY ./conf/wordpress-conf.sh /

# RUN mkdir -p /var/www/html

# RUN chmod +x wordpress-conf.sh

# Expose PHP-FPM port
# EXPOSE 9000

# Download and install WordPress
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -zxvf latest.tar.gz && \
#     rm latest.tar.gz && \
#     mv wordpress/* /var/www/html/ && \
#     rmdir wordpress && \
#     chown -R www-data:www-data /var/www/html && \
#     chmod -R 755 /var/www/html

# COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# ENTRYPOINT [ "./wordpress-conf.sh" ]
