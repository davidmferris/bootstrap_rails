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
      invoke :fentis
      super
    end

    def fentis
      invoke :custom_gemfile
    end

    def custom_gemfile
      build :replace_gemfile
    end

    protected

    def get_builder_class
      Fentis::AppBuilder
    end
  end
end
