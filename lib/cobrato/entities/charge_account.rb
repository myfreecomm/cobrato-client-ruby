module Cobrato
  module Entities
    class ChargeAccount < Base
      attribute :id,                        Integer
      attribute :bank_account_id,           Integer
      attribute :portfolio_code,            String
      attribute :agreement_code,            String
      attribute :agreement_code_digit,      String
      attribute :name,                      String
      attribute :initial_number,            Integer
      attribute :current_number,            Integer
      attribute :end_number,                Integer
      attribute :status,                    String
      attribute :registered_charges,        Boolean
      attribute :agreement_number,          Integer
      attribute :initial_remittance_number, Integer
      attribute :current_remittance_number, Integer
      attribute :remittance_cnab_pattern,   Integer
      attribute :interest_amount_per_month, Decimal
      attribute :mulct_type,                String
      attribute :mulct_value,               Decimal
      attribute :transmission_code,         String
    end
  end
end