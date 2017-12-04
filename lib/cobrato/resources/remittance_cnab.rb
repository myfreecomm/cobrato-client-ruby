require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class RemittanceCnab < Base
      crud :show, :list, :destroy

      def create(params)
        deprecate(params, %w[charge_ids charge_config_ids])
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
        puts "Warning: The 'charges' endpoint is deprecated. Use 'items' endpoint instead."
        http.get("#{resource_base_path}/#{id}/charges") do |response|
          respond_with_collection(response, 'Charge')
        end
      end

      def items(id)
        http.get("#{resource_base_path}/#{id}/items") do |response|
          hash            = parsed_body(response)
          collection_name = hash.keys.first
          class_name      = collection_name.gsub(/(.)(.*)s/) { "#{$1.upcase}#{$2}" }
          naked_klass     = entity_klass(class_name)

          hash[collection_name].map { |item| naked_klass.new(item) }
        end
      end

    end
  end
end
