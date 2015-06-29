module Cobrato
  module Resources
    class Charge < Base

      def receive(id, params)
        http.post("#{resource_base_path}/#{id}/receive", { body: params }) do |response|
          respond_with_entity(response)
        end
      end

      def undo_receive(id)
        http.post("#{resource_base_path}/#{id}/undo_receive") do |response|
          respond_with_entity(response)
        end
      end

      def deliver_billet(id, emails=nil)
        body = {to: emails}
        http.post("#{resource_base_path}/#{id}/deliver_billet", { body: body }) do |response|
          response.code == 200
        end
      end

    end
  end
end