module Cobrato
  module Entities
    class CreditCard < Base
      attribute :id,             Integer
      attribute :number,         String
      attribute :holder_name,    String
      attribute :unusable,       Boolean
      attribute :brand,          String
      attribute :expiration,     String
      attribute :avs_address,    String
      attribute :avs_number,     String
      attribute :avs_complement, String
      attribute :avs_district,   String
      attribute :avs_zipcode,    String
      attribute :payer_id,       Integer
    end
  end
end