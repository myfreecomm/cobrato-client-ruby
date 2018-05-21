module Cobrato
  module Entities
    class Cnab < Base
      attribute :id,               Integer
      attribute :type,             String
      attribute :file_name,        String
      attribute :status,           String
      attribute :config_id,        Integer
      attribute :charge_config_id, Integer # DEPRECATED

      def charge_config_id
        puts "Warning: 'charge_config_id' is deprecated. Use 'config_id' instead."
        super
      end
    end
  end
end
