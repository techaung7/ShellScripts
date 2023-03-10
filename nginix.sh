#!/bin/bash

# Install Apache2 web server
sudo apt-get update
sudo apt-get install -y nginix

# Move website files to /var/www/html
sudo cp -r projectfiles /var/www/html/

# Restart Apache2 web server
sudo systemctl restart nginix
