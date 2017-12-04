module Cobrato
  module Entities
    class Payment < Base
      attribute :id,                  Integer
      attribute :payment_config_id,   Integer
      attribute :amount,              Decimal
      attribute :date,                Date
      attribute :our_number,          String
      attribute :payment_method,      String
      attribute :payment_type,        String
      attribute :account,             String
      attribute :account_digit,       String
      attribute :agency,              String
      attribute :bank_code,           String
      attribute :payee_name,          String
      attribute :payee_document_type, String
      attribute :payee_document,      String
      attribute :doc_goal,            String
      attribute :ted_goal,            String
      attribute :registration_status, String
    end
  end
end
