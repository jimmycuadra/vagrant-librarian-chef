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

          project_path = get_project_path(env, config)
          if project_path
            env[:ui].info "Installing Chef cookbooks with Librarian-Chef..."
            environment = Librarian::Chef::Environment.new({
              :project_path => project_path
            })
            Librarian::Action::Ensure.new(environment).run
            Librarian::Action::Resolve.new(environment).run
            Librarian::Action::Install.new(environment).run
          else
            env[:ui].info "Couldn't find Cheffile at #{config.cheffile_path}."
          end
          @app.call(env)
        end

        def get_project_path(env, config)
          # look for a Cheffile in the configured cheffile_dir
          if FileTest.exist? File.join(env[:root_path], config.cheffile_path)
            return File.join(env[:root_path], config.cheffile_dir)
          elsif FileTest.exist? File.expand_path(config.cheffile_path)
            return File.expand_path(config.cheffile_dir)
          end
        end
      end
    end
  end
end
