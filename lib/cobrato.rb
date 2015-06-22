require "typhoeus"
require "multi_json"

require "cobrato/version"
require "co0brato/configuration"
require "co0brato/client"

module Cobrato
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
