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
      attribute :note,                     String
      attribute :payee_name,               String
      attribute :company_name,             String # DEPRECATED

      # Shared with some
      attribute :due_date,                 Date
      attribute :calculation_period,       Date
      attribute :receita_federal_code,     String
      attribute :mulct_amount,             Decimal
      attribute :interest_amount,          Decimal
      attribute :discount_amount,          Decimal
      attribute :competency_year,          String
      attribute :competency_month,         String
      attribute :city_code,                Integer
      attribute :license_plate,            String
      attribute :renavam,                  String
      attribute :uf,                       String

      # Transfer specific
      attribute :account,                  String
      attribute :account_digit,            String
      attribute :agency,                   String
      attribute :bank_code,                String
      attribute :company_id,               Integer
      attribute :company_document_type,    String
      attribute :company_document,         String
      attribute :payee_id,                 Integer # DEPRECATED
      attribute :payee_document_type,      String # DEPRECATED
      attribute :payee_document,           String # DEPRECATED
      attribute :doc_goal,                 String
      attribute :ted_goal,                 String

      # Billet specific
      attribute :barcode,                  String

      # GPS specific
      attribute :gps_payment_code,         String
      attribute :other_entities_amount,    Decimal
      attribute :monetary_update,          Decimal

      # DARF specific
      attribute :reference_number,         String

      # DAS specific
      attribute :gross_revenue,            Decimal
      attribute :gross_revenue_percentage, Decimal

      # IPVA specific
      attribute :payment_option,           String

      # ICMS-SP specific
      attribute :state_registration,       String
      attribute :active_debt_registration, String
      attribute :installment_number,       Integer

      # FGTS specific
      attribute :taxpayer_document,        String
      attribute :taxpayer_document_type,   String

      def payee_id
        puts "Warning: 'payee_id' is deprecated. Use 'company_id' instead."
        super
      end

      def payee_name
        puts "Warning: 'payee_name' is deprecated. Use 'company_name' instead."
        super
      end

      def payee_document
        puts "Warning: 'payee_document' is deprecated. Use 'company_document' instead."
        super
      end

      def payee_document_type
        puts "Warning: 'payee_document_type' is deprecated. Use 'company_document_type' instead."
        super
      end
    end
  end
end
