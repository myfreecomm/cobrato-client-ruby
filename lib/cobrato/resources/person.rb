module Cobrato
  module Resources
    class Person < Base
      crud :show, :list, :create, :update

      protected

      def irregular_resource_name
        "people"
      end
    end
  end
end
