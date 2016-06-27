module Cobrato
  module Entities
    class CreditCard < Base
      attribute :id,                        Integer
      attribute :number,                    String
      attribute :holder_name,               String
      attribute :reusable,                  Boolean
      attribute :reusability_status,        String
      attribute :reusability_error_message, String
      attribute :brand,                     String
      attribute :expiration,                String
      attribute :avs_address,               String
      attribute :avs_number,                String
      attribute :avs_complement,            String
      attribute :avs_district,              String
      attribute :avs_zipcode,               String
      attribute :payer_id,                  Integer
      attribute :charge_config_id,          Integer
    end
  end
end
