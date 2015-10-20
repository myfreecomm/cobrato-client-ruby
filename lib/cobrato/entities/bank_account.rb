module Cobrato
  module Entities
    class BankAccount < Base
      attribute :id,            Integer
      attribute :payee_id,      Integer
      attribute :bank_code,     String
      attribute :agency,        String
      attribute :agency_digit,  String
      attribute :account,       String
      attribute :account_digit, String
    end
  end
end