#!/usr/bin/env bash

# Get updates
sudo apt-get update
# Install apache
sudo apt-get -y install apache2

# So we do not get "Could not reliably determine the server's fully qualified domain name" error
echo "ServerName myVagrant" | sudo tee /etc/apache2/conf-available/servername.conf

# Restarting apache
sudo service apache2 reload

# Print the VM IP address
ip addr show eth1 | egrep "inet\ " | cut -f1 -d "/" | cut -f2 -d "t"
