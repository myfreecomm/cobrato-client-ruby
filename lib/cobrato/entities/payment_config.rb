module Cobrato
  module Entities
    class PaymentConfig < Base
      attribute :id,              Integer
      attribute :name,            String
      attribute :bank_account_id, Integer
      attribute :payee_id,        Integer
    end
  end
end
