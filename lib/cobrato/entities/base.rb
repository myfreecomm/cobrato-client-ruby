require "virtus"

module Cobrato
  module Entities
    class Base
      include Virtus.model

      attribute :_links, Array

      def url(action)
        link = _links.detect { |l| l["rel"].to_s == action.to_s } || {}
        link.fetch("href", "")
      end
    end
  end
end
