require "spec_helper"

describe Cobrato::Resources::PaymentMethod do

  let(:token)        { '0b21f3bc2b01c49f91a2b7cff1c38c01' }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::PaymentMethod }

  subject { described_class.new(http) }

  describe "#list" do
    it "returns an array of payment methods" do
      VCR.use_cassette("payment_methods/list/success") do
        payment_methods = subject.list
        expect(payment_methods).to be_a(Array)
        payment_methods.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end
end