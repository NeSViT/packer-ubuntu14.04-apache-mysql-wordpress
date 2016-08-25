#!/bin/bash

set -x

echo "DOWNLOAD TOOLS FOR ADD NEW REPOSITORY"
sudo apt-get install -y software-properties-common

echo "ADD REPOSITORY WITH PHP5"
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

echo "INSTALL VIM"
sudo apt-get install -y vim

echo "INSTALLING APACHE2 AND PHP5.6"
sudo apt-get install -y apache2 php5.6 php5.6-mysql mysql-client
       
echo "INSERT DIRECTORY ROOT TO DEFAULT APACHE CONFIG"
sudo sed -i 's/html/WordPress/g' /etc/apache2/sites-available/000-default.conf

echo "INSTALLING MYSQL-SERVER with password root"
sudo echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server

# create database for wordpress
sudo mysql -uroot -proot -e "CREATE DATABASE wordpress;"
# create specific user in mysql
sudo mysql -uroot -proot -e "CREATE USER wordpressuser@'localhost' IDENTIFIED BY 'password';"
# grant permissions to all tables in database wordpress to user wordpressuser
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@'localhost' IDENTIFIED BY 'password';"
# update permissions
sudo mysql -uroot -proot -e "FLUSH PRIVILEGES;"

echo "RESTART MYSQL"
sudo service mysql restart

echo "Install git"
sudo apt-get install -y git

echo "Install WORDPRESS from GitHub"
sudo git clone https://github.com/WordPress/WordPress.git /var/www/WordPress
sudo rm -rf /var/www/WordPress/.git
sudo cp /var/www/WordPress/wp-config-sample.php /var/www/WordPress/wp-config.php
echo "SET CONFIG IN WP-CONFIG.PHP" 
sudo sed -i 's/database_name_here/wordpress/g' /var/www/WordPress/wp-config.php
sudo sed -i 's/username_here/wordpressuser/g' /var/www/WordPress/wp-config.php
sudo sed -i 's/password_here/password/g' /var/www/WordPress/wp-config.php

echo "RESTART APACHE2"
sudo service apache2 restart

echo "CONFIGURE INSTALL.PHP PAGE AUTOMATICALLY"
# run command from user vagrant to configure wordpress start page 
sudo -u vagrant -i -- wp core install --path="/var/www/WordPress" --url=10.10.100.20 --title="DEVOPS START" --admin_user=nesvits --admin_password=password --admin_email=nesvits@gmail.com
sudo -u vagrant -i -- curl http://loripsum.net/api/5 | sudo -u vagrant -i -- wp post generate --path="/var/www/WordPress" --post_content --count=10

echo "RESTART APACHE2"
sudo service apache2 restart