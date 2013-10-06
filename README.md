# Vagrant Salt Grails

Create grails server with Vagrant and Grails
Based on [Vagrant Salt Base](https://github.com/bfolliot/vagrant-salt-base)


## Requirements:
 * [Vagrant Hostmanager Plugin](https://github.com/smdahlen/vagrant-hostmanager)
 * [Vagrant Salt Plugin](https://github.com/saltstack/salty-vagrant)

## Additional Optional Vagrant Plugins:
- [Vagrant VbGuest](https://github.com/dotless-de/vagrant-vbguest)
- [Vagrant Box Updater](https://github.com/spil-ruslan/vagrant-box-updater)

## Installation

1/ Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads).

2/ Install [Vagrant](http://downloads.vagrantup.com).

3/ Install plugin vagrant-vbguest.

`vagrant plugin install vagrant-vbguest`

4/ Install plugin vagrant-salt.

`vagrant plugin install vagrant-salt` 

5/ Install plugin vagrant-hostmanager.

`vagrant plugin install vagrant-hostmanager`

6/ Add grails in /Shares/srv (Change vx.x.x to your grails version)

`git clone -b vx.x.x https://github.com/grails/grails-core.git Shares/srv/grails`

7/ Edit settings.yml

8/ Start your vm

`vagrant up`