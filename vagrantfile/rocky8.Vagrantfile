# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    Name = "rocky8"

    config.vm.define Name do |instance|
      instance.vm.box = "generic/rocky8"
      instance.vm.hostname = Name
      instance.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
      instance.vm.synced_folder ".", "/vagrant" ## Explicit mount
      instance.vm.provider :virtualbox do |vb|
        vb.name = Name
        vb.cpus = 1
        vb.memory = 1024
      end
      # -- OPTIONS --
      # instance.vm.provision "shell", path: ${INITIATION_SCRIPT}
      # instance.vm.network "private_network", ip: "192.168.56.100"
    end
   
  end
