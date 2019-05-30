# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"
# NODE_COUNT = 4
SUBNET="172.3.4"
# puts "------------------------------"
NODE_COUNT = ENV['NODE_COUNT'].to_i > 0  ? ENV['NODE_COUNT'].to_i : 4
sPath=ENV['SHARE_PATH']
# if sPath.to_s.length > 0 
#     puts "Shared folder is #{sPath}"
# else
#     puts "
# Usage :
#     Bash     : 
#                 mkdir ../forVm
#                 SHARE_PATH=../forVm vagrant up

#     Win(cmd) : 
#                mkdir c:\Users\xxxx\forVm
#                set SHARE_PATH=c:\Users\xxxx\forVm 
#                vagrant up
# "
# end
# puts "------------------------------"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_udp: false
  config.vm.provision "shell", path: "./script/vmhost.sh" 
  config.vm.provision "shell", inline: "echo #{SUBNET}.10 s1 >> /etc/hosts" 
  (1..NODE_COUNT).each do |i|
    config.vm.provision "shell", inline: "echo #{SUBNET}.1#{i} n#{i} >> /etc/hosts" 
  end
  
  config.vm.define "s1" do |server|
    server.vm.hostname = "Server1"
    server.vm.network :private_network, ip: "#{SUBNET}.10"
    server.vm.provision "shell", path: "./script/vmserver.sh" 
    if sPath.to_s.length > 0 
      server.vm.synced_folder sPath, "/home/vagrant/forVm"
    end

    (1..NODE_COUNT).each do |i|
      server.vm.provision "shell", inline: "echo n#{i} >> /etc/ansible/hosts" 
    end

    server.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", "1024"
        ]
    end
  end 
  
  (1..NODE_COUNT).each do |i|
    config.vm.define "n#{i}" do |node|
      node.vm.hostname = "Node#{i}"
      node.vm.network :private_network, ip: "#{SUBNET}.1#{i}"
    
      node.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", "256"
        ]
      end
    end
  end
end
