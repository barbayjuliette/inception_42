FROM debian:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y php-fpm

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# EXPOSE 9000

CMD ["php-fpm8.2", "-F"]

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
