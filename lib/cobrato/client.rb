module Cobrato
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
    end

    def authenticated?
      http.get("") do |response|
        response.code == 200
      end
    rescue RequestError => e
      raise e unless e.code == 401
      false
    end

    def payees
      Resources::Payee.new(http)
    end

    def bank_accounts
      Resources::BankAccount.new(http)
    end

    def charge_accounts
      Resources::ChargeAccount.new(http)
    end

    def charge
      Resources::Charge.new(http)
    end

    def webhooks
      Resources::Webhook.new(http)
    end
  end
end