require "spec_helper"

describe Cobrato::Resources::ChargeConfig do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::ChargeConfig }
  let(:params) do
    {
      "bank_account_id" => 25,
      "portfolio_code" => "17",
      "agreement_code" => "123456",
      "agreement_code_digit" => "1",
      "name" => "Conta Cobrança",
      "initial_number" => 1,
      "current_number" => 1,
      "end_number" => 1000,
      "status" => "pending",
      "registered_charges" => true,
      "agreement_number" => 4576361,
      "initial_remittance_number" => 1,
      "remittance_cnab_pattern" => 240,
      "interest_amount_per_month" => 1.02,
      "mulct_type" => "percentage",
      "mulct_value" => 10.12
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge configs" do
      VCR.use_cassette("charge_configs/list/success") do
        charge_configs = subject.list
        expect(charge_configs).to be_a(Array)
        charge_configs.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an ChargeConfig instance showd" do
      VCR.use_cassette("charge_configs/show/success") do
        charge_config = subject.show(88)
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.agreement_code).to eq("123456")
      end
    end
  end

  describe "#update" do
    it "returns a ChargeConfig instance updated" do
      VCR.use_cassette("charge_configs/update/success") do
        charge_config = subject.update(88, {end_number: 1338})
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.end_number).to eq(1338)
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charge_configs/destroy/success") do
        result = subject.destroy(132)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a charge config" do
      VCR.use_cassette("charge_configs/create/success") do
        charge_config = subject.create(params)
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.agreement_code).to eq(params['agreement_code'])
      end
    end
  end
end
