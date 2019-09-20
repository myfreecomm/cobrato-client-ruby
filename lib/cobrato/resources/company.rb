module Cobrato
  module Resources
    class Company < Base
      crud :all

      protected

      def irregular_resource_name
        "companies"
      end
    end
  end
end