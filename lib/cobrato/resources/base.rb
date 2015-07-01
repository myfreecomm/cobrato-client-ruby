require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class Base
      include Wisper::Publisher
      extend Hooks
      attr_accessor :http

      def collection_name
        "#{base_klass.downcase}s"
      end

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

      notify :create, :destroy

      protected
        def respond_with_collection(response, naked_klass = entity_klass)
          hash = parsed_body(response)
          hash[collection_name].map do |item|
            naked_klass.new(item)
          end
        end

        def respond_with_entity(response, naked_klass = entity_klass)
          item = parsed_body(response)
          naked_klass.new(item)
        end

        def resource_base_path
          @resource_base_path ||= "/#{collection_name}"
        end

        def base_klass
          @base_klass ||= self.class.name.split("::").last
        end

        def entity_klass
          @entity_klass ||= Cobrato::Entities.const_get(base_klass.to_sym)
        end

    end
  end
end
