#!/bin/bash

# Install and configure a database server MySQL on CentOS
set -e
dnf update -y
dnf module enable -y mysql:8.4
dnf install -y @mysql:8.4/server mysql

# Start and enable MySQL service
systemctl enable --now mysqld

# Wait for MySQL to start completely
sleep 10

# Configure MySQL for external access (skip secure installation for development)
mysql -u root <<EOF
-- Allow root to connect from any host without password (development only)
UPDATE mysql.user SET Host='%' WHERE User='root' AND Host='localhost';
FLUSH PRIVILEGES;
EOF

# Configure MySQL to bind to all interfaces
echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mysql-server.cnf

# Configure firewall to allow MySQL connections
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload

# Restart MySQL to apply configuration changes
systemctl restart mysqld

# Wait for MySQL to restart
sleep 10

# Run SQL scripts to set up DB and demo data
mysql -u root < /vagrant/database/create-table.sql
mysql -u root < /vagrant/database/insert-demo-data.sql

echo "Database server setup completed successfully!"