module Cobrato
  module Resources
    class ChargeTemplate < Base

      def list(params={})
        http.get("/charge_configs/#{params[:charge_config_id]}/charge_templates", params: params) do |response|
          respond_with_collection(response)
        end
      end

      def show(id, params)
        http.get("/charge_configs/#{params[:charge_config_id]}/charge_templates/#{id}", params: params) do |response|
          respond_with_entity(response)
        end
      end

      def update(id, params, parent)
        http.put("/charge_configs/#{parent[:charge_config_id]}/charge_templates/#{id}", body: params) do |response|
          respond_with_entity(response)
        end
      end

      def destroy(id, parent)
        http.delete("/charge_configs/#{parent[:charge_config_id]}/charge_templates/#{id}") do |response|
          response.code == 204
        end
      end


      def create(params, parent)
        http.post("/charge_configs/#{parent[:charge_config_id]}/charge_templates", body: params) do |response|
          respond_with_entity(response)
        end
      end
    end
  end
end
