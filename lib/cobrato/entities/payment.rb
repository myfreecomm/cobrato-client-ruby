module Cobrato
  module Entities
    class Payment < Base
      # Shared with all
      attribute :id,                       Integer
      attribute :payment_config_id,        Integer
      attribute :amount,                   Decimal
      attribute :date,                     Date
      attribute :our_number,               String
      attribute :payment_method,           String
      attribute :payment_type,             String
      attribute :registration_status,      String

      # Shared with some
      attribute :due_date,                 Date
      attribute :calculation_period,       Date
      attribute :receita_federal_code,     String
      attribute :mulct_amount,             Decimal
      attribute :interest_amount,          Decimal

      # Transfer specific
      attribute :account,                  String
      attribute :account_digit,            String
      attribute :agency,                   String
      attribute :bank_code,                String
      attribute :payee_name,               String
      attribute :payee_document_type,      String
      attribute :payee_document,           String
      attribute :doc_goal,                 String
      attribute :ted_goal,                 String

      # Billet specific
      attribute :discount_amount,          Decimal
      attribute :extra_amount,             Decimal
      attribute :barcode,                  String

      # GPS specific
      attribute :gps_payment_code,         String
      attribute :competency_month,         String
      attribute :competency_year,          String
      attribute :other_entities_amount,    Decimal
      attribute :monetary_update,          Decimal

      # DARF specific
      attribute :reference_number,         String

      # DAS specific
      attribute :gross_revenue,            Decimal
      attribute :gross_revenue_percentage, Decimal
    end
  end
end
