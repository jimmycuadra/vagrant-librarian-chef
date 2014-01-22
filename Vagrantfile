#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

require "vagrant-vmware-fusion"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # To develop against the VMware Fusion provider, you must set an environment variable
  # pointing to the officially installed Vagrant. You must also be running the same version
  # of Ruby.
  #
  # $ VAGRANT_INSTALLER_EMBEDDED_DIR=/Applications/Vagrant/embedded bundle exec vagrant
  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "git"
  end
end
