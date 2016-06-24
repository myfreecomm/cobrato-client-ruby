module Cobrato
  module Resources
    class CreditCard < Base
      crud :show, :create, :list

      def charges(id, params={})
        http.get("#{resource_base_path}/#{id}/charges", { params: params }) do |response|
          respond_with_collection(response, 'Charge')
        end
      end
    end
  end
end
