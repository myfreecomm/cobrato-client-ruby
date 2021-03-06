require "cobrato/resources/hooks"

module Cobrato
  module Resources
    class RegressCnab < Base
      crud :create, :show, :list, :destroy

      def create(params)
        deprecate(params, %w[charge_config_id])
        super
      end

      def file(id)
        http.get("#{resource_base_path}/#{id}/file") do |response|
          respond_with_openstruct(response)
        end
      end

    end
  end
end
