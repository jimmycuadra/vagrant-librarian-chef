require "librarian-chef"
require "librarian/action"

module VagrantPlugins
  module LibrarianChef
    module Action
      class Install
        def initialize(app, env)
          @app = app
          # Config#finalize! SHOULD be called automatically
          env[:global_config].librarian_chef.finalize!
        end

        def call(env)
          config = env[:global_config].librarian_chef
          # look for a Cheffile in the configured cheffile_dir
          if FileTest.exist? File.join(env[:root_path], config.cheffile_path)
            env[:ui].info "Installing Chef cookbooks with Librarian-Chef..."
            environment = Librarian::Chef::Environment.new({
              :project_path => config.cheffile_dir
            })
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
