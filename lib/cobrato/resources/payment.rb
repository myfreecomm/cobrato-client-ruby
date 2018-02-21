module Cobrato
  module Resources
    class Payment < Base
      crud :all

      def cancel(id)
        http.post("#{resource_base_path}/#{id}/cancel") do |response|
          respond_with_entity response
        end
      end

      def schema(params)
        http.get("#{resource_base_path}/schema", params: params) do |response|
          parsed_body(response)
        end
      end

      def unauthorize(id)
        http.post("#{resource_base_path}/#{id}/unauthorize") do |response|
          respond_with_entity response
        end
      end
    end
  end
end
