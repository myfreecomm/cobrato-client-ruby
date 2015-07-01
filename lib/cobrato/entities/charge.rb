module Cobrato
  module Entities
    class Charge < Base
      attribute :id,                Integer 
      attribute :charge_account_id, Integer
      attribute :due_date,          Date
      attribute :processing_date,   Date
      attribute :document_kind,     String
      attribute :document_date,     Date
      attribute :document_number,   String
      attribute :custom_our_number, Boolean
      attribute :our_number,        String
      attribute :our_number_digit,  String
      attribute :total_amount,      Decimal
      attribute :instructions,      String
      attribute :demonstrative,     String
      attribute :payer_emails,      String
      attribute :received,          Boolean
      attribute :received_amount,   Decimal
      attribute :received_at,       Date
      attribute :processing_date,   Date
      attribute :for_homologation,  Boolean
      attribute :billet,            String
    end
  end
end