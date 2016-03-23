module Cobrato
  class Signature
    attr_accessor :secret

    def initialize(secret)
      @secret = secret
    end

    def check?(cobrato_request_id, signature_to_check, body)
      cobrato_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret, "#{cobrato_request_id}#{body}")
      signature_to_check == cobrato_signature
    end
  end
end
