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
          env[:ui].info "Installing Chef cookbooks with Librarian-Chef..."
          environment = Librarian::Chef::Environment.new
          Librarian::Action::Ensure.new(environment).run
          Librarian::Action::Resolve.new(environment).run
          Librarian::Action::Install.new(environment).run
          @app.call(env)
        end
      end
    end
  end
end
