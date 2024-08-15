#!/bin/bash


# Start MariaDB service
service mariadb start

# Wait for MariaDB to start
echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
  echo "MariaDB is not up yet..."
  sleep 1
done

# Create and configure the database
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$DB_PASS_ROOT';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
FLUSH PRIVILEGES;
EOF

# Start MariaDB in the foreground
systemctl start mariadb
