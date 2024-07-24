
# MariaDB will be the database to store information 
# about our wordpress users and settings.
# We have to create the Mariadb image and create 2 users.

# FROM debian:bullseye

# RUN apt-get update && apt-get upgrade --yes && \
# 	apt-get install -y mariadb-server vim zsh wget git mycli

# # RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# # COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
# # COPY init.sql /etc/mysql/init.sql

# COPY ./tools/mariadb-config.sh /mariadb-config.sh

# RUN chmod +x /mariadb-config.sh

# RUN chown -R mysql:mysql /var/lib/mysql

# RUN chown -R mysql:mysql /var/lib/mysql

# RUN mkdir -p /var/www/mysql

# EXPOSE 3306

# # CMD ["mysqld"]
# ENTRYPOINT [ "./mariadb-config.sh" ]


# # Copy configuration script and make it executable
# COPY ./tools/mariadb-config.sh /mariadb-config.sh
# RUN chmod +x /mariadb-config.sh

# # Ensure the ownership of MariaDB data directory
# RUN mkdir -p /run/mysqld && \
#     chown mysql:mysql /run/mysqld && \
#     chown -R mysql:mysql /var/lib/mysql

# # Create any other directories as needed
# RUN mkdir -p /var/www/mysql

# # Expose the default MariaDB port
# EXPOSE 3306

# # Set the entrypoint
# ENTRYPOINT ["/mariadb-config.sh"]


# Latest

# FROM debian:bullseye

# # Update and install packages
# RUN apt-get update && apt-get upgrade --yes && \
#     apt-get install -y mariadb-server

# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/.
# COPY ./tools/init.sql /etc/mysql/init.sql
# COPY ./tools/mariadb-config.sh /usr/local/bin/mariadb-config.sh

# RUN mkdir /run/mysqld && chmod +x /usr/local/bin/mariadb-config.sh

# CMD ["mariadb-config.sh"]

# Test

FROM debian:bullseye

# Update and install packages
RUN apt-get update && apt-get upgrade --yes && \
    apt-get install -y mariadb-server mariadb-client

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./tools/mariadb-config.sh /mariadb-config.sh

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod +x /mariadb-config.sh && chmod +x /etc/mysql/init.sql 
RUN mkdir -p /var/log/mysql && chown mysql:mysql /var/log/mysql

CMD ["/mariadb-config.sh"]
