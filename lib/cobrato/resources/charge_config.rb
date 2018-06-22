module Cobrato
  module Resources
    class ChargeConfig < Base
      crud :all

      def deactivate(id)
        http.post("#{resource_base_path}/#{id}/deactivate") do |response|
          respond_with_entity response
        end
      end
    end
  end
end