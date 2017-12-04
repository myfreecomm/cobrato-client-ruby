module Cobrato
  module Entities
    class RemittanceCnab < Base
      attribute :id,               Integer
      attribute :charge_config_id, Integer # DEPRECATED
      attribute :config_id,        Integer
      attribute :status,           String

      def charge_config_id
        puts "Warning: 'charge_config_id' is deprecated. Use 'config_id' instead."
        super
      end
    end
  end
end
