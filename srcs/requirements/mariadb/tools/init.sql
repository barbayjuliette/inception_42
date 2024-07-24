-- Create the database only if it does not already exist
CREATE DATABASE IF NOT EXISTS wordpress;

-- Create the user only if it does not already exist
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'password';

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
