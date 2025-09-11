#!/bin/bash

# Install and configure a database server MySQL on CentOS
set -e
apt-get update
apt-get install -y mysql-server

# Start and enable MySQL service
systemctl enable --now mysqld

# Run SQL scripts to set up DB and demo data
mysql -u root < /vagrant/database/create-table.sql
mysql -u root < /vagrant/database/insert-demo-data.sql