require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class RemittanceCnab < Base
      crud :show, :list, :destroy

      def create(params)
        http.post(resource_base_path, { body: params }) do |response|
          respond_with_collection(response)
        end
      end

      def file(id)
        http.get("#{resource_base_path}/#{id}/file") do |response|
          respond_with_openstruct(response)
        end
      end

      def charges(id)
        http.get("#{resource_base_path}/#{id}/charges") do |response|
          respond_with_collection(response, 'Charge')
        end
      end

    end
  end
end
