module Cobrato
  module Resources
    class ChargingType < Base
      crud :all

      def list
        http.get(resource_base_path) do |response|
          bank_billets =  parsed_body(response)[collection_name]['bank_billets'].map do |item|
                            Cobrato::Entities::BankBillet.new(item)
                          end

          Struct.new(:bank_billets).new(bank_billets)
        end
      end

    end
  end
end