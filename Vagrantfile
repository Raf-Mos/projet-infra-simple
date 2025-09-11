# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Web server
  config.vm.define "web-server" do |web|
    web.vm.box = "ubuntu/jammy64"
    web.vm.box_check_update = true

    # Configure the web server network
    web.vm.network "public_network"
    web.vm.network "private_network", ip: "192.168.56.10"

    
    web.vm.synced_folder "./website", "/var/www/html", type: "virtualbox"

    # Provisioning with a shell script
    web.vm.provision "shell", path: "scripts/provision-web-ubuntu.sh", privileged: true

    # Configure the web server resources
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.name = "web-server"
      vb.cpus = 1
    end
  end

  # Database server
  config.vm.define "db-server" do |db|
    db.vm.box = "generic/centos9s"
    db.vm.box_check_update = true

    # Configure the database server network
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.network "forwarded_port", guest: 3306, host: 3307

    # Provisioning with a shell script
    db.vm.provision "shell", path: "scripts/provision-db-centos.sh", privileged: true

    # Configure the database server resources
    db.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.name = "db-server"
      vb.cpus = 1
    end
  end
end
