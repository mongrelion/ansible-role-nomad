# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "minimal/centos7"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "256"
  end

  config.vm.define "server" do |machine|
    machine.vm.network "private_network", ip: "192.168.59.100"
  end

  config.vm.define "client" do |machine|
    machine.vm.network "private_network", ip: "192.168.59.101"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "tests/vagrant.yml"
  end
end
