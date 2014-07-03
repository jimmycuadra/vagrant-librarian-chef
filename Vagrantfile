#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

require "vagrant-librarian-chef"

Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-14.04"

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "git"
  end
end
