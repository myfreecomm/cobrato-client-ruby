module Cobrato
  module Resources
    class BankAccount < Base

      def collection_name
        "bank_accounts"
      end

      def portfolio_codes(id)
        http.get("#{resource_base_path}/#{id}/portfolio_codes") do |response|
          parsed_body(response)["portfolio_codes"]
        end
      end

    end
  end
end