require "rails/generators/migration"

module I18n
  module Object
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        source_root File.expand_path("./templates", __dir__)

        def copy_file_for_initializer
          copy_file "initializer.tt", "config/initializers/i18n_object.rb"
        end
      end
    end
  end
end
