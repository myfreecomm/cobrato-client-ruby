module Cobrato
  module Entities
    class Webhook < Base
      attribute :id,           Integer
      attribute :description,  String
      attribute :url,          String
    end
  end
end