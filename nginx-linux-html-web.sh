#!/bin/bash

# Update packages
sudo yum update -y

# Install Nginx
sudo yum install -y nginx

#install git 
sudo yum install -y git
# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Remove existing default HTML directory (optional)
sudo rm -rf /usr/share/nginx/html

# Clone GitHub repository into Nginx web server's root directory
sudo git clone <git url> /usr/share/nginx/html
