module Cobrato
  module Entities
    class Charge < Base
      attribute :id,                  Integer
      attribute :charge_account_id,   Integer
      attribute :due_date,            Date
      attribute :processing_date,     Date
      attribute :document_kind,       String
      attribute :document_date,       Date
      attribute :document_number,     String
      attribute :custom_our_number,   Boolean
      attribute :our_number,          String
      attribute :our_number_digit,    String
      attribute :total_amount,        Decimal
      attribute :instructions,        String
      attribute :demonstrative,       String
      attribute :payer_emails,        String
      attribute :payer_info,          String
      attribute :received,            Boolean
      attribute :received_amount,     Decimal
      attribute :received_at,         Date
      attribute :processing_date,     Date
      attribute :for_homologation,    Boolean
      attribute :payment_method,      String
      attribute :has_cnab_remittance, Boolean
      attribute :billet_url,          String

      def initialize(attrs)
        attrs = JSON.parse(attrs.to_json, symbolize_names: true)
        attrs[:billet_url] = attrs[:_links].find { |l| l[:rel] == 'billet' }[:href]
        super attrs
      end
    end
  end
end