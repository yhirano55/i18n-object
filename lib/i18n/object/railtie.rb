require "active_support/core_ext/string/inflections"

module I18n
  module Object
    class Railtie < ::Rails::Railtie
      initializer "i18n-object.configs" do
        config.after_initialize do
          require "i18n/object/translation_methods"

          Array(::I18n::Object.namespaces).each do |namespace|
            class_name = namespace.classify

            parent_object = ::Object
            target_object = nil

            class_name.split("::").each do |const_name|
              parent_object = if parent_object.const_defined?(const_name)
                                parent_object.const_get(const_name)
                              else
                                parent_object.const_set(const_name, ::Class.new)
                              end
              target_object = parent_object
            end

            target_object.include ::I18n::Object::TranslationMethods
            target_object.scope = class_name.underscore.split("/").freeze
          end
        end
      end
    end
  end
end
