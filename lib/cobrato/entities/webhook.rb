module Cobrato
  module Entities
    class Webhook < Base
      attribute :id,           Integer
      attribute :description,  String
      attribute :url,          String
      attribute :secret,       String
    end
  end
end
