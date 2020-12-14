#!/bin/bash

# Setup nitrome server block
cp config/nitrome.conf /etc/nginx/sites-available/nitrome.com
ln -s /etc/nginx/sites-available/nitrome.com /etc/nginx/sites-enabled/nitrome.com
cp -r Nitrome/ /var/www/nitrome
