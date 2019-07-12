# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "rails-dev-box"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  # config.vm.network "private_network", ip: "192.168.188.110"

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'docker-dev'
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    # default: sync local folder to /vagrant inside VM
  end

  config.vm.provision :docker
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

end
