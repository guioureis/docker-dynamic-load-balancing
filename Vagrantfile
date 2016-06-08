# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080 # app
  config.vm.network "forwarded_port", guest: 4280, host: 4280 # haproxy
  config.vm.network "forwarded_port", guest: 8500, host: 8500 # consul

  config.vm.provider "virtualbox" do |vb|
	  vb.memory = "1024"
  end

  config.vm.provision "ansible" do |ansible|
	  ansible.playbook = "provision/dev.yml"
  end
  
  # fix for zsh inside vagrant box
  config.vm.provision "shell", path: "provision/fixVagrantZsh.sh"
end
