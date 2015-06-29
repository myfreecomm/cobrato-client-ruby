require "virtus"

module Cobrato
  module Entities
    class Base
      include Virtus.model

      def collection_name
        "#{base_klass.downcase}s"
      end
    end
  end
end