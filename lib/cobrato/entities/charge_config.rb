module Cobrato
  module Entities
    class ChargeConfig < Base
      attribute :id,                        Integer
      attribute :name,                      String
      attribute :type,                      String
      attribute :status,                    String
      attribute :payee_id,                  String
      attribute :available_charge_types,    Array
      attribute :deactivated_at,            DateTime
      attribute :timezone,                  String

      # billet specifics
      attribute :bank_account_id,           Integer
      attribute :portfolio_code,            String
      attribute :agreement_code,            String
      attribute :agreement_code_digit,      String
      attribute :initial_number,            Integer
      attribute :next_number,               Integer
      attribute :end_number,                Integer
      attribute :registered_charges,        Boolean
      attribute :remittance_agreement_code, Integer
      attribute :initial_remittance_number, Integer
      attribute :current_remittance_number, Integer
      attribute :remittance_cnab_pattern,   Integer
      attribute :transmission_code,         String
      attribute :pre_released_billet,       Boolean
      attribute :writing_off_deadline,      Integer

      # payment gateway specifics
      attribute :gateway_name,              String
      attribute :gateway_id,                String
      attribute :gateway_key,               String
      attribute :billet_gateway_id,         String
      attribute :billet_gateway_key,        String
      attribute :account_holder,            Boolean
      attribute :use_avs,                   Boolean
    end
  end
end
