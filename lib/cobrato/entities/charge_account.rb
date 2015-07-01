module Cobrato
  module Entities
    class ChargeAccount < Base
      attribute :id,                   Integer 
      attribute :bank_account_id,      Integer
      attribute :portfolio_code,       String
      attribute :agreement_code,       String
      attribute :agreement_code_digit, String
      attribute :name,                 String
      attribute :initial_number,       Integer
      attribute :current_number,       Integer
      attribute :end_number,           Integer
      attribute :status,               String
    end
  end
end