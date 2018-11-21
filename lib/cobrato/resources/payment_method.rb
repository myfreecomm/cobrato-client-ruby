module Cobrato
  module Resources
    class PaymentMethod < Base

      def list
        http.get(resource_base_path) do |response|
          parsed_body(response)
        end
      end
    end
  end
end