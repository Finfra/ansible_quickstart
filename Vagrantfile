# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"
NODE_COUNT = 4
SUBNET="172.22.101"
NODE_COUNT = ENV['NODE_COUNT'].to_i > 0  ? ENV['NODE_COUNT'].to_i : 3


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "server-1" do |server|
    config.vm.hostname = "Server"
    config.vm.network :private_network, ip: "#{SUBNET}.1"
    config.vm.box = "centos/7"
    config.vm.provision "shell", path: "./vagrant/vmhost.sh", args: ""
    config.vm.provision "shell", inline: "yum install -y ansible", args: ""
    config.vm.provision "shell", inline: "echo #{SUBNET}.1 server-1 >> /etc/hosts", args: ""
    NODE_COUNT.times do |i|
      config.vm.provision "shell", inline: "echo #{SUBNET}.1#{i} node-#{i} >> /etc/hosts", args: ""
    end

      
    config.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", "512",
        ]
    end
  end 
  
  NODE_COUNT.times do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.provision "shell",
        inline: "echo hello from node #{i}"
      config.vm.hostname = "centos7box#{i}"
      config.vm.network :private_network, ip: "#{SUBNET}.1#{i}"
      config.vm.provision "shell", path: "./vagrant/vmhost.sh", args: ""
      config.vm.box = "centos/7"
      config.vm.provision "shell", inline: "echo #{SUBNET}.1 server-1 >> /etc/hosts", args: ""
      NODE_COUNT.times do |i|
        config.vm.provision "shell", inline: "echo #{SUBNET}.1#{i} node-#{i} >> /etc/hosts", args: ""
      end
    end

    config.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "50",
          "--memory", "256",
        ]
      end
  end

end
