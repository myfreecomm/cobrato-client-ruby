require "spec_helper"

describe Cobrato::Resources::CreditCard do
  let(:http)         { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }
  let(:entity_klass) { Cobrato::Entities::CreditCard }

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#show" do
    it "returns a CreditCard instance showd" do
      VCR.use_cassette("credit_cards/show/success") do
        credit_card = subject.show(7)
        expect(credit_card).to be_a(entity_klass)
        expect(credit_card.holder_name).to eq("John Doe")
        expect(credit_card.number).to eq("6167")
      end
    end
  end
end
