FROM debian:bullseye

RUN apt-get update && apt-get upgrade --yes && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/inception.key \
    -out /etc/ssl/certs/inception.crt \
    -subj "/C=SG/L=Singapore/O=42Singapore/OU=student/CN=jbarbay.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
