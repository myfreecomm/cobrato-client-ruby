module Cobrato
  module Resources
    class Payment < Base
      crud :all

      def cancel(id)
        http.post("#{resource_base_path}/#{id}/cancel") do |response|
          respond_with_entity response
        end
      end
    end
  end
end
