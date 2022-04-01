#!/bin/bash
echo "# Vagrant file fet per Adrià Sabaté" > VagrantFile
echo "Vagrant.configure("'"'"2"'"'") do |config|" >> VagrantFile
echo "config.vm.box = "'"'"generic/debian10"'"'"" >> VagrantFile
echo "config.vm.hostname = "'"'"adsade"'"'"" >> VagrantFile
echo "config.vm.provider "'"'"virtualbox"'"'" do |v|"  >> VagrantFile
echo "v.name = "'"'"sh7adsade"'"'"" >> VagrantFile
echo "v.memory = 2048" >> VagrantFile
echo "v.cpus = 1"  >> VagrantFile
echo "v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']"  >> VagrantFile
echo "end"  >> VagrantFile
echo "config.vm.network "'"'"forwarded_port"'"'", guest: 80, host: 8000"  >> VagrantFile
echo "config.vm.network "'"'"forwarded_port"'"'", guest: 443, host: 8080" >> VagrantFile
echo "config.vm.network "'"'"forwarded_port"'"'", guest: 3306, host: 8888"  >> VagrantFile
echo "config.vm.network "'"'"forwarded_port"'"'", guest: 22, host: 8808"  >> VagrantFile
echo "config.vm.provision "'"'"shell"'"'", inline: <<-SHELL"  >> VagrantFile
echo "sudo apt-get update -y"  >> VagrantFile
echo "sudo apt-get upgrade -y" >> VagrantFile
echo "sudo apt-get install -y net-tools" >> VagrantFile
echo "sudo apt-get install -y openssh" >> VagrantFile
echo "sudo apt-get install -y apache2 apache2-doc" >> VagrantFile
echo "Vols instalar els paquets extra? [S per si, N per no]"
read opc
if  [[  $opc  ==  "s" ]]
then
echo "sudo apt-get install -y openssh-sftp-server" >> VagrantFile
echo "sudo apt-get install -y mariadb-server" >> VagrantFile
echo "sudo apt-get install -y mariadb-client" >> VagrantFile
fi
echo  "SHELL" >> VagrantFile
echo "end"  >> VagrantFile
exit 0
