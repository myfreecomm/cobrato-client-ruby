require "spec_helper"

describe Cobrato::Resources::Payment do
  let(:token)        { '3fa5e9ecc23e477fd7ba3a41063a9fab' }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::Payment }

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge configs" do
      VCR.use_cassette("payments/list/success") do
        payments = subject.list
        expect(payments).to be_a(Array)
        payments.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an Payment instance showed" do
      VCR.use_cassette("payments/show/success") do
        charge_config = subject.show(10)
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.amount).to eq(456.78)
      end
    end
  end

  describe "#update" do
    it "returns a Payment instance updated" do
      VCR.use_cassette("payments/update/success") do
        charge_config = subject.update(10, { amount: '125.99' })
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.amount).to eq(125.99)
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("payments/destroy/success") do
        result = subject.destroy(11)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    context "payment config" do
      let(:params) do
        {
          payment_config_id: 1,
          payment_type: 'provider',
          payment_method: 'ted_other_ownership',
          amount: 69.55,
          date: Date.new(2017, 12, 24),
          our_number: '456789',
          bank_code: '341',
          agency: '9358',
          payee_document_type: 'cpf',
          payee_document: '123.456.789-09',
          payee_name: 'John Doe',
          account: '21500',
          account_digit: '3',
          ted_goal: '00016',
        }
      end

      it "creates a charge config" do
        VCR.use_cassette("payments/create/success") do
          charge_config = subject.create(params)
          expect(charge_config).to be_a(entity_klass)
          expect(charge_config.amount).to eq(69.55)
        end
      end
    end
  end
end
