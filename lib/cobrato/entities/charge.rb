module Cobrato
  module Entities
    class Charge < Base
      attribute :id,                             Integer
      attribute :type,                           String
      attribute :charge_config_id,               Integer
      attribute :due_date,                       Date
      attribute :processing_date,                Date
      attribute :document_kind,                  String
      attribute :document_date,                  Date
      attribute :document_number,                String
      attribute :custom_our_number,              Boolean
      attribute :our_number,                     String
      attribute :our_number_digit,               String
      attribute :total_amount,                   Decimal
      attribute :instructions,                   String
      attribute :demonstrative,                  String
      attribute :payer_emails,                   String
      attribute :payer_info,                     String
      attribute :received,                       Boolean
      attribute :received_amount,                Decimal
      attribute :received_at,                    Date
      attribute :processing_date,                Date
      attribute :for_homologation,               Boolean
      attribute :registrable,                    Boolean
      attribute :registration_status,            String
      attribute :payer_national_identifier_type, String
      attribute :payer_national_identifier,      String
      attribute :payer_name,                     String
      attribute :payer_number,                   String
      attribute :payer_complement,               String
      attribute :payer_street,                   String
      attribute :payer_neighbourhood,            String
      attribute :payer_zipcode,                  String
      attribute :payer_city,                     String
      attribute :payer_state,                    String
    end
  end
end
