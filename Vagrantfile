# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"

  config.vm.provision "shell", inline: <<-SHELL
    yum -y install man gcc g++ flex flex-devel bison
    echo "plang loel"
  SHELL
end
