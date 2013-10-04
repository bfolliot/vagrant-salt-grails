# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vbguest.auto_update = true

  config.vbguest.no_remote = false

  config.vm.box = "Ubuntu-raring"

  config.vm.box_url = "https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box"

  config.vm.hostname = "grails-vm"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.hostmanager.aliases = "grails.dev"

  config.vm.network :private_network, ip: "192.168.50.20"

  config.vm.synced_folder "./Shares/Projects", "/home/vagrant/Projects"
end
