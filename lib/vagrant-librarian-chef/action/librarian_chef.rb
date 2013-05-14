require "librarian-chef"
require "librarian/action"

module VagrantPlugins
  module LibrarianChef
    module Action
      class Install
        def initialize(app, env)
          @app = app
        end

        def call(env)
          # look for a Cheffile in the Vagrant root_path
          if FileTest.exist?(env[:root_path] + "Cheffile")
            env[:ui].info "Installing Chef cookbooks with Librarian-Chef..."
            environment = Librarian::Chef::Environment.new
            Librarian::Action::Ensure.new(environment).run
            Librarian::Action::Resolve.new(environment).run
            Librarian::Action::Install.new(environment).run
          end
          @app.call(env)
        end
      end
    end
  end
end
