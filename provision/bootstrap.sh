#!/usr/bin/env bash

# Get updates
sudo apt-get update

# Install apache
sudo apt-get -y install apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# So we do not get "Could not reliably determine the server's fully qualified domain name" error
echo "ServerName myVagrant" | sudo tee /etc/apache2/conf-available/servername.conf

# Link /vagrant/html to /var/www/html
sudo rm -rf /var/www/html
sudo ln -s /vagrant/html /var/www

# Restarting apache
sudo service apache2 reload

# Install git
sudo apt-get -y install git

# Install MySQL
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

# Install PHP
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

# Print the VM IP address
ip addr show eth1 | egrep "inet\ " | cut -f1 -d "/" | cut -f2 -d "t"
