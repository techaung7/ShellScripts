#!/bin/bash

# Update package index
sudo apt update

# Install Apache2 web server and MySQL server
sudo apt install -y apache2 mysql-server

# Secure the MySQL installation
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt install -y php libapache2-mod-php php-mysql php-curl

# Set permissions on /var/www/html
sudo chmod -R 777 /var/www/html

# Remove default index.html file
sudo rm /var/www/html/index.html

# Install unzip utility
sudo apt install -y unzip

# Install Composer
sudo apt install -y composer

# Unzip project files to /var/www/html
sudo unzip /var/www/html/project.zip -d /var/www/html/

# Connect to MySQL and create database and user
sudo mysql -e "CREATE DATABASE database_name;"
sudo mysql -e "CREATE USER 'user_name'@'%' IDENTIFIED WITH mysql_native_password BY 'PASSWORD';"
sudo mysql -e "GRANT ALL ON binary_database.* TO 'user_name'@'%';"

# Set SQL mode to remove ONLY_FULL_GROUP_BY
sudo mysql -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"

# Restart Apache2
sudo service apache2 restart
