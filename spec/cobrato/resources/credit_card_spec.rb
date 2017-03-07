require "spec_helper"

describe Cobrato::Resources::CreditCard do
  let(:token)         { "6a742533dca088fb557f801cdf35d5a0" }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::CreditCard }
  let(:params) do
    {
      number: "4012001037141112",
      cvv: 123,
      holder_name: "JONH DOE",
      brand: "visa",
      expiration: "05/18",
      charge_config_id: 7,
      payer_id: 1,
      soft_descriptor: "MyCompany"
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
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    it "creates a credit card" do
      VCR.use_cassette("credit_cards/create/success") do
        credit_card = subject.create(params)
        expect(credit_card).to be_a(entity_klass)
        expect(credit_card.number).to eq("401200******1112")
        expect(credit_card.holder_name).to eq("JONH DOE")
        expect(credit_card.charge_config_id).to eq(7)
        expect(credit_card.payer_id).to eq(1)
      end
    end
  end

  describe "#update" do
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    it "updates a credit card" do
      VCR.use_cassette("credit_cards/update/success") do
        credit_card = subject.update(912, payer_id: 1)
        expect(credit_card).to be_a(entity_klass)
        expect(credit_card.payer_id).to eq(1)
      end
    end
  end

  describe "#list" do
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    it "returns an array of all credit cards" do
      VCR.use_cassette("credit_cards/list/success") do
        credit_cards = subject.list
        expect(credit_cards.count).to eql(14)
        expect(credit_cards).to be_a(Array)
        credit_cards.each do |cc|
          expect(cc).to be_a(entity_klass)
        end
      end
    end

    it "returns an array of all credit cards filtered" do
      VCR.use_cassette("credit_cards/list/success-filtered") do
        credit_cards = subject.list(brand: "mastercard", charge_config_id: 1)
        expect(credit_cards.count).to eql(1)
        expect(credit_cards).to be_a(Array)
        credit_cards.each do |cc|
          expect(cc).to be_a(entity_klass)
          expect(cc.brand).to eql("mastercard")
          expect(cc.charge_config_id).to eql(1)
        end
      end
    end
  end

  describe "#charges" do
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    it "returns an array of all charges from a credit card" do
      VCR.use_cassette("credit_cards/charges/success") do
        charges = subject.charges(13)
        expect(charges.count).to eql(15)
        expect(charges).to be_a(Array)
        charges.each do |c|
          expect(c).to be_a(Cobrato::Entities::Charge)
        end
      end
    end

    it "returns an array of all charges from a credit card paginated" do
      VCR.use_cassette("credit_cards/charges/success-paginated") do
        charges = subject.charges(13, page: 2, per_page: 5)
        expect(charges.count).to eql(5)
        expect(charges).to be_a(Array)
        charges.each do |c|
          expect(c).to be_a(Cobrato::Entities::Charge)
        end
      end
    end
  end
end
