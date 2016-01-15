module Cobrato
  module Resources
    class BankAccount < Base
      crud :all

      def portfolio_codes(id)
        http.get("#{resource_base_path}/#{id}/portfolio_codes") do |response|
          parsed_body(response)["portfolio_codes"]
        end
      end

    end
  end
end