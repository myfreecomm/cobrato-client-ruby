module Cobrato
  module Entities
    class PaymentMethod < Base
      attribute :identifier,  String
      attribute :group,       String
      attribute :label,       String
    end
  end
end