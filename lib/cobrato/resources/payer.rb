module Cobrato
  module Resources
    class Payer < Base
      crud :show, :list, :create, :update
    end
  end
end