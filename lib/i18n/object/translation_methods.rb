require "active_support/core_ext/string/inflections"

module I18n
  module Object
    module TranslationMethods
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        def scope
          @scope
        end

        def scope=(value)
          @scope = value
        end

        private

          def respond_to_missing?(method_name, *args)
            !!translate(method_name, args) || super
          end

          def method_missing(method_name, *args, &block)
            translate(method_name, args) || super
          end

          def translate(method_name, args)
            options = args.first || {}
            ::I18n.t!(method_name, **options.merge(scope: scope))
          rescue ::I18n::MissingTranslationData
            nil
          end
      end
    end
  end
end
