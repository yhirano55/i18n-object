require "i18n/object/version"

begin
  require "rails"
  require_relative "object/railtie"
rescue LoadError
  nil
end

require "i18n"

module I18n
  module Object
    class << self
      attr_accessor :namespaces
    end
  end
end
