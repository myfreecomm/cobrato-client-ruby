module Cobrato
  module Entities
    class ChargeTemplate < Base
      attribute :id,                        Integer
      attribute :name,                      String
      attribute :notification_emails,       String
      attribute :charged_amount,            Decimal
      attribute :due_date,                  Date
      attribute :document_date,             Date
      attribute :document_number,           String
      attribute :document_kind,             String
      attribute :charge_config_id,          Integer
      attribute :instructions,              String
      attribute :demonstrative,             String
      attribute :registrable,               Boolean
      attribute :auto_send_billet,          Boolean
      attribute :interest_amount_per_month, Decimal
      attribute :mulct_type,                String
      attribute :mulct_value,               Decimal
    end
  end
end
