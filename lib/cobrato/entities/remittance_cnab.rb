module Cobrato
  module Entities
    class RemittanceCnab < Base
      attribute :id,                Integer
      attribute :charge_account_id, Integer
      attribute :status,            String
    end
  end
end
