require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class Base
      attr_accessor :http
      extend Hooks

      def initialize(http)
        @http = http
      end

      def parsed_body(response)
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
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

      protected
        def respond_with_collection(response, naked_klass = entity_klass)
          hash = parsed_body(response)
          hash["collection"].map do |item|
            naked_klass.new(item)
          end
        end

        def respond_with_entity(response, naked_klass = entity_klass)
          item = parsed_body(response)
          naked_klass.new(item)
        end

        def resource_base_path
          @resource_base_path ||= "/#{base_klass.tableize}"
        end

        def base_klass
          @base_klass ||= self.class.name.demodulize.last
        end

    end
  end
end