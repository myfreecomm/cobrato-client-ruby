module Cobrato
  module Resources
    class Payer < Base
      puts "Warning: Payers endpoint is deprecated. Please use People endpoint instead."
      crud :show, :list, :create, :update

      protected

      def irregular_resource_name
        "people"
      end
    end
  end
end
