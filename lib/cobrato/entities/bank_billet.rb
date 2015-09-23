module Cobrato
  module Entities
    class BankBillet < Base
      attribute :bank_code,       String
      attribute :bank_name,       String
      attribute :portfolio_codes, Array
      attribute :regress,         Boolean
      attribute :remittance,      Boolean
    end
  end
end