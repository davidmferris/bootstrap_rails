require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Fentis
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Configure for selected database. PostgreSQL by default."

    class_option :skip_test_unit, type: :boolean, aliases: "-T", default: true,
      desc: "Skip Test::Unit files"

    class_option :skip_turbolinks, type: :boolean, default: true,
      desc: "Skips the turbolinks gem"

    class_option :api, type: :boolean, default: false,
      desc: "Adds API support gems"

    class_option :skip_bundle, type: :boolean, aliases: "-B", default: true,
                 desc: "Don't run bundle install"

    def finish_template
      invoke :fentis_setup
      super
    end

    def fentis_setup
      invoke :custom_gemfile
      invoke :install_devise
      invoke :install_activeadmin

      invoke :create_database
      invoke :setup_rspec
      invoke :initial_commit
    end

    def create_database
      build :create_database
    end

    def custom_gemfile
      build :replace_gemfile
    end

    def initial_commit
      build :initial_commit
    end

    def install_activeadmin
      build :install_activeadmin
    end

    def install_devise
      build :install_devise
    end

    def setup_rspec
      build :setup_rspec
    end

    protected

    def get_builder_class
      Fentis::AppBuilder
    end
  end
end
