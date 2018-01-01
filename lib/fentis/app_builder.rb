module Fentis
  class AppBuilder < Rails::AppBuilder
    def create_database
      bundle_command "exec rails db:create db:migrate db:seed"
    end

    def initial_commit
      git add: "."
      git commit: "-m 'initial commit'"
    end

    def install_activeadmin
      generate 'active_admin:install'
    end

    def install_devise

    end

    def replace_gemfile
      remove_file "Gemfile"
      template "Gemfile.erb", "Gemfile"
    end

    def setup_rspec
      generate 'rspec:install'
    end
  end
end
