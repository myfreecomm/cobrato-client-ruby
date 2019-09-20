module Cobrato
  module Entities
    class BankAccount < Base
      attribute :id,            Integer
      attribute :company_id,    Integer
      attribute :payee_id,      Integer # DEPRECATED
      attribute :bank_code,     String
      attribute :agency,        String
      attribute :agency_digit,  String
      attribute :account,       String
      attribute :account_digit, String

      def payee_id
        puts "Warning: 'payee_id' is deprecated. Use 'company_id' instead."
        super
      end
    end
  end
end