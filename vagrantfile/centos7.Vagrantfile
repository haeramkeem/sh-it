# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    Name = "centos7"

    config.vm.define Name do |instance|
      instance.vm.box = "centos/7"
      instance.vm.hostname = Name
      instance.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
      instance.vm.provider :virtualbox do |vb|
        vb.name = Name
        vb.cpus = 1
        vb.memory = 1024
      end
      # instance.vm.provision "shell", path: ${INITIATION_SCRIPT}
      # instance.vm.network "private_network", ip: "192.168.56.100"
    end
   
  end
