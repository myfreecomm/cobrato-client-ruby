require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class Base
      include Wisper::Publisher
      include Helper
      extend Hooks
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      def create(params)
        http.post(resource_base_path, { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      def show(id)
        http.get("#{resource_base_path}/#{id}") do |response|
          respond_with_entity(response)
        end
      end

      def list
        http.get(resource_base_path) do |response|
          respond_with_collection(response)
        end
      end

      def destroy(id)
        http.delete("#{resource_base_path}/#{id}") do |response|
          response.code == 204
        end
      end

      def update(id, params)
        http.put("#{resource_base_path}/#{id}", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      notify :create, :destroy
    end
  end
end
