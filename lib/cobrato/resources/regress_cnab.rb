require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class RegressCnab
      include Wisper::Publisher
      include Helper
      extend Hooks
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      def create(params)
        http.post(base_path, { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      def show(id)
        http.get("#{base_path}/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      def list
        http.get(base_path) do |response|
          respond_with_collection(response)
        end
      end

      def destroy(id)
        http.delete("#{base_path}/#{id}") do |response|
          response.code == 204
        end
      end

      def file(id)
        http.get("#{base_path}/#{id}/file") do |response|
          respond_with_openstruct(response)
        end
      end

      private

        def base_path
          '/regress_cnabs'
        end

        def collection_name
          "regress_cnabs"
        end
    end
  end
end
