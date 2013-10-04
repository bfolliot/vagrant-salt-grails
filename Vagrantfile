# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'


# Makes sure that we can symbolize recursively the keys
# http://devblog.avdi.org/2009/07/14/recursively-symbolize-keys/
def symbolize_keys(hash)
  hash.inject({}){|result, (key, value)|
    new_key = case key
              when String then key.to_sym
              else key
              end
    new_value = case value
                when Hash then symbolize_keys(value)
                else value
                end
    result[new_key] = new_value
    result
  }
end

# http://stackoverflow.com/questions/3903376/how-do-i-save-settings-as-a-hash-in-a-external-file
settings = YAML::load_file "settings.yml"
settings = symbolize_keys(settings)

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
  config.vm.synced_folder "./Shares/srv", "/srv"

  
  config.vm.provision :salt do |salt|

    salt.install_args = "v0.16.0"

    salt.install_type = "git"

    salt.minion_config = "Shares/srv/salt/minion"

    salt.run_highstate = true

    salt.verbose = true

  end



end
