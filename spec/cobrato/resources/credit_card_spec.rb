require "spec_helper"

describe Cobrato::Resources::CreditCard do
  let(:http)         { Cobrato::Http.new("7a5f7a1f9f449d142db4f36851be59f5") }
  let(:entity_klass) { Cobrato::Entities::CreditCard }
  let(:params) do
    {
      number: "4012001037141112",
      cvv: 123,
      holder_name: "JOÃO DAS COUVES",
      brand: "visa",
      expiration: "05/18",
      charge_config_id: 1,
      payer_id: 1,
      make_reusable: true
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#show" do
    it "returns a CreditCard instance show" do
      VCR.use_cassette("credit_cards/show/success") do
        credit_card = subject.show(14)
        expect(credit_card).to be_a(entity_klass)
        expect(credit_card.holder_name).to eq("Fulano de Tal")
        expect(credit_card.number).to eq("545301******6167")
        expect(credit_card.charge_config_id).to eq(8)
      end
    end
  end

  describe "#create" do
    it "creates a credit card" do
      VCR.use_cassette("credit_cards/create/success") do
        credit_card = subject.create(params)
        expect(credit_card).to be_a(entity_klass)
        expect(credit_card.id).to eql(14)
        expect(credit_card.number).to eq("401200******1112")
        expect(credit_card.holder_name).to eq("JOÃO DAS COUVES")
        expect(credit_card.charge_config_id).to eq(1)
        expect(credit_card.payer_id).to eq(1)
      end
    end
  end
end
