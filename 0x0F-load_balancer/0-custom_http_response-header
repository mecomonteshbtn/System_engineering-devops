#!/usr/bin/env bash
# Automatizing the nginx configuration
sudo apt-get -y update
sudo apt-get -y install nginx
sudo sed -i "15i \\\tadd_header X-Served-By 1574-web-01;" /etc/nginx/nginx.conf
sudo service nginx restart
