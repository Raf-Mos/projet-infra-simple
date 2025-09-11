#!/bin/bash

# Install and configure a web server (e.g., Nginx) on Ubuntu
set -e
apt-get update
apt-get install -y nginx


# Start and enable Nginx service
systemctl enable --now nginx

