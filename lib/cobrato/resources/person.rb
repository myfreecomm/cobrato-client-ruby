module Cobrato
  module Resources
    class Person < Base
      crud :show, :list, :create, :update

      protected

      def class_plural
        "people"
      end
    end
  end
end
