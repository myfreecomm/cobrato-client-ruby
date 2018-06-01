module Cobrato
  module Resources
    class Payer < Base
      crud :show, :list, :create, :update

      %w[show list create update].each do |method|
        define_method method do |*args|
          puts "Warning: The #{self.class.name}##{method} method is depracated. See Cobrato API docs for more info"
          super(*args)
        end
      end

      protected

      def irregular_resource_name
        "people"
      end
    end
  end
end
