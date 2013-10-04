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

  config.vm.box = settings[:box] if settings[:box]

  config.vm.box_url = settings[:url] if settings[:url]

  config.vm.hostname = settings[:hostname] if settings[:hostname]

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  if settings[:host_aliases]
    config.hostmanager.aliases = settings[:host_aliases]
  end

  config.vm.network :private_network, ip: settings[:ip] if settings[:ip]


  config.vm.provider :virtualbox do |v|
    # This setting gives the VM 1024MB of RAM instead of the default 384.
    if settings[:ram]
      v.customize ["modifyvm", :id, "--memory", settings[:ram] ]
    end
    # v.customize ["modifyvm", :id, "--name", settings[:name] if settings[:name]]

    # This setting makes it so that network access from inside the vagrant guest
    # is able to resolve DNS using the hosts VPN connection.
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # This option lets the real-time clock (RTC) operate in UTC time (see the section called “"Motherboard" tab”).
     v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
  end 

  if settings[:share_folders]
    settings[:share_folders].each do |sf_name, sf|
      config.vm.synced_folder sf[:host_path], sf[:guest_path]
    end
  end
  config.vm.synced_folder "./Shares/srv", "/srv"

  
  config.vm.provision :salt do |salt|

    salt.install_args = "v0.16.0"

    salt.install_type = "git"

    salt.minion_config = "Shares/srv/salt/minion"

    salt.run_highstate = true

    salt.verbose = (settings[:salt_verbose] ? settings[:salt_verbose] : false)

  end

  config.vm.provision :hostmanager



end
