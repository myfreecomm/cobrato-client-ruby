require "typhoeus"
require "multi_json"

require "cobrato/version"
require "cobrato/configuration"
require "cobrato/client"
require "cobrato/http"

require "cobrato/entities/base"
require "cobrato/entities/payee"
require "cobrato/entities/bank_account"
require "cobrato/entities/charge_account"
require "cobrato/entities/charge"
require "cobrato/entities/webhook"

require "cobrato/resources/base"
require "cobrato/resources/payee"
require "cobrato/resources/bank_account"
require "cobrato/resources/charge_account"
require "cobrato/resources/charge"
require "cobrato/resources/webhook"

module Cobrato
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token)
    Client.new(token)
  end
end
