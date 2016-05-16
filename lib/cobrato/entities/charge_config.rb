module Cobrato
  module Entities
    class ChargeConfig < Base
      attribute :id,                        Integer
      attribute :name,                      String
      attribute :type,                      String
      attribute :status,                    String

      # billet specifics
      attribute :bank_account_id,           Integer
      attribute :portfolio_code,            String
      attribute :agreement_code,            String
      attribute :agreement_code_digit,      String
      attribute :initial_number,            Integer
      attribute :current_number,            Integer
      attribute :end_number,                Integer
      attribute :registered_charges,        Boolean
      attribute :agreement_number,          Integer
      attribute :initial_remittance_number, Integer
      attribute :current_remittance_number, Integer
      attribute :remittance_cnab_pattern,   Integer
      attribute :interest_amount_per_month, Decimal
      attribute :mulct_type,                String
      attribute :mulct_value,               Decimal
      attribute :transmission_code,         String

      # payment gateway specifics
      attribute :gateway_name,              String
      attribute :gateway_id,                String
      attribute :gateway_key,               String
      attribute :use_avs,                   Boolean
    end
  end
end