module I18n
  module Object
    class Config
      attr_accessor :namespaces

      def initialize
        @namespaces = []
      end
    end
  end
end
