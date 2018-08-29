module Cobrato
  module Entities
    class PaymentConfig < Base
      attribute :id,              Integer
      attribute :name,            String
      attribute :bank_account_id, Integer
      attribute :timezone,        String
    end
  end
end
