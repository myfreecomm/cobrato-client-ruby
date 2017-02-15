module Cobrato
  module Entities
    class Charge < Base
      attribute :id,                             Integer
      attribute :type,                           String
      attribute :charge_config_id,               Integer
      attribute :charged_amount,                 Decimal
      attribute :notification_emails,            String
      attribute :payer_id,                       Integer
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
      attribute :for_homologation,               Boolean
      attribute :for_homologation,               Boolean
      attribute :canceled_at,                    DateTime
      attribute :paid_amount,                    Decimal
      attribute :paid_at,                        Date

      attribute :total_amount,                   Decimal  # deprecated
      attribute :received,                       Boolean  # deprecated
      attribute :received_amount,                Decimal  # deprecated
      attribute :received_at,                    Date     # deprecated

      # billet specifics
      attribute :due_date,                       Date
      attribute :processing_date,                Date
      attribute :document_kind,                  String
      attribute :document_date,                  Date
      attribute :document_number,                String
      attribute :custom_our_number,              Boolean
      attribute :our_number,                     String
      attribute :our_number_digit,               String
      attribute :instructions,                   String
      attribute :demonstrative,                  String
      attribute :registrable,                    Boolean
      attribute :registration_status,            String
      attribute :interest_amount_per_month,      Decimal
      attribute :mulct_type,                     String
      attribute :mulct_value,                    Decimal
      attribute :payment_tax,                    Decimal
      attribute :auto_send_billet,               Boolean
      attribute :email_sender_name,              String
      attribute :email_subject,                  String
      attribute :email_text,                     String
      attribute :charge_template_id,             Integer
      attribute :paid_discount,                  Decimal
      attribute :paid_additions,                 Decimal
      attribute :paid_rebate,                    Decimal
      attribute :paid_difference,                Decimal
      attribute :available_billet,               Boolean

      # payment gateway specifics
      attribute :credit_card_id,                 Integer
      attribute :description,                    String
      attribute :soft_descriptor,                String
      attribute :payment_method,                 String
      attribute :installments,                   Integer
      attribute :payment_gateway_status,         String
      attribute :payment_gateway_message,        String
    end
  end
end
