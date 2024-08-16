FROM debian:bullseye

# Update and install packages
RUN apt-get update && apt-get upgrade --yes && \
    apt-get install -y --no-install-recommends --no-install-suggests mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/maria-setup.sh /
RUN chmod +x /maria-setup.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/maria-setup.sh" ]
