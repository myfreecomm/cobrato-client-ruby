module Cobrato
  module Resources
    module Helper
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

      def respond_with_openstruct(response)
        OpenStruct.new(MultiJson.load(response.body))
      end

      def resource_base_path
        @resource_base_path ||= "/#{collection_name}"
      end

      def base_klass
        @base_klass ||= self.class.name.split('::').last
      end

      def entity_klass
        @entity_klass ||= Cobrato::Entities.const_get(base_klass.to_sym)
      end

      def parsed_body(response)
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
      end

      def collection_name
        "#{base_klass.downcase}s"
      end
    end
  end
end
