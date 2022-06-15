# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |group|

    Name = #{BOX_NAME}

    group.vm.define Name do |instance|
      instance.vm.box = "ubuntu/focal64"
      instance.vm.hostname = Name
      instance.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
      instance.vm.provider :virtualbox do |vb|
        vb.name = Name
        vb.cpus = 1
        vb.memory = 1024
      end
      # -- OPTIONS --
      # instance.vm.network "private_network", ip: "192.168.56.100"
      # instance.vm.provision "shell", path: #{INITIATION_SCRIPT}
    end
   
  end
