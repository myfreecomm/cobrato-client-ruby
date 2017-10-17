require "spec_helper"

describe Cobrato::Resources::PaymentConfig do
  let(:token)        { "3fa5e9ecc23e477fd7ba3a41063a9fab" }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::PaymentConfig }

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge configs" do
      VCR.use_cassette("payment_configs/list/success") do
        payment_configs = subject.list
        expect(payment_configs).to be_a(Array)
        payment_configs.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an PaymentConfig instance showed" do
      VCR.use_cassette("payment_configs/show/success") do
        charge_config = subject.show(2)
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.name).to eq("Pagamento Eduardo fake - Santander")
      end
    end
  end

  describe "#update" do
    it "returns a PaymentConfig instance updated" do
      VCR.use_cassette("payment_configs/update/success") do
        charge_config = subject.update(2, {name: "Pagamento Eduardo Real - Santander"})
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.name).to eq("Pagamento Eduardo Real - Santander")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("payment_configs/destroy/success") do
        result = subject.destroy(3)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    context "payment config" do
      it "creates a charge config" do
        VCR.use_cassette("payment_configs/create/success") do
          charge_config = subject.create({ name: "Nova Configuração de Pagamento", bank_account_id: 155 })
          expect(charge_config).to be_a(entity_klass)
          expect(charge_config.name).to eq("Nova Configuração de Pagamento")
        end
      end
    end
  end
end
