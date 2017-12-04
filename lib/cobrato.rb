require "typhoeus"
require "multi_json"
require "wisper"

require "cobrato/version"
require "cobrato/configuration"
require "cobrato/client"
require "cobrato/http"
require "cobrato/signature"

require "cobrato/entities/base"
require "cobrato/entities/payee"
require "cobrato/entities/payer"
require "cobrato/entities/bank_account"
require "cobrato/entities/charge_config"
require "cobrato/entities/payment_config"
require "cobrato/entities/payment"
require "cobrato/entities/charge"
require "cobrato/entities/webhook"
require "cobrato/entities/bank_billet"
require "cobrato/entities/regress_cnab"
require "cobrato/entities/remittance_cnab"
require "cobrato/entities/credit_card"
require "cobrato/entities/charge_template"

require "cobrato/resources/base"
require "cobrato/resources/payee"
require "cobrato/resources/payer"
require "cobrato/resources/bank_account"
require "cobrato/resources/charge_config"
require "cobrato/resources/payment_config"
require "cobrato/resources/payment"
require "cobrato/resources/charge"
require "cobrato/resources/webhook"
require "cobrato/resources/charging_type"
require "cobrato/resources/regress_cnab"
require "cobrato/resources/remittance_cnab"
require "cobrato/resources/credit_card"
require "cobrato/resources/charge_template"

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

  def self.subscribe(event, callback)
    Wisper.subscribe(callback, on: event, with: :call)
  end

  def self.signature(secret)
    Signature.new(secret)
  end
end
