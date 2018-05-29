module Cobrato
  module Entities
    class Payer < Base
      puts "Warning: Payer entity is deprecated. Please use Person entity instead."

      attribute :id,                       Integer
      attribute :national_identifier_type, String
      attribute :national_identifier,      String
      attribute :name,                     String
      attribute :zipcode,                  String
      attribute :city,                     String
      attribute :state,                    String
      attribute :neighbourhood,            String
      attribute :number,                   String
      attribute :complement,               String
      attribute :street,                   String
    end
  end
end
