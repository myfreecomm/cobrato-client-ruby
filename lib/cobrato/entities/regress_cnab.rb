module Cobrato
  module Entities
    class RegressCnab < Base
      attribute :id,                Integer
      attribute :charge_account_id, Integer
      attribute :status,            String
      attribute :report,            Hash
    end
  end
end
