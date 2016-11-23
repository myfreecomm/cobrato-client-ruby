require "base64"

module Cobrato
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = "https://app.cobrato.com.br/api/v1"
      @user_agent = "Cobrato Ruby Client v#{Cobrato::VERSION}"
    end
  end
end
