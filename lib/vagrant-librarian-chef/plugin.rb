begin
  require "vagrant"
rescue LoadError
  abort "vagrant-librarian-chef must be loaded in a Vagrant environment."
end

require "vagrant-librarian-chef/action/librarian_chef"

module VagrantPlugins
  module LibrarianChef
    class Plugin < Vagrant.plugin("2")
      name "vagrant-librarian-chef"
      description <<-DESC
A Vagrant plugin to install Chef cookbooks using Librarian-Chef.
DESC
      action_hook "librarian_chef" do |hook|
        hook.before Vagrant::Action::Builtin::Provision, Action::Install
      end
    end
  end
end
