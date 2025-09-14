#!/bin/bash

# Install and configure a web server (e.g., Nginx) on Ubuntu
set -e
apt-get update
apt-get install -y nginx git

# Copy website files from dist folder if it exists
if [ -d /var/www/html/dist ]; then
  cp -r /var/www/html/dist/* /var/www/html/
  echo "Website files copied from dist folder"
fi

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Start and enable Nginx service
systemctl enable --now nginx

echo "Web server setup completed successfully!"

