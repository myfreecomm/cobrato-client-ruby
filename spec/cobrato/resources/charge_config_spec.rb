require "spec_helper"

describe Cobrato::Resources::ChargeConfig do
  let(:token)        { "45d4e96c707f2a45f73ac9848ff8eeab" }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::ChargeConfig }
  let(:billet_params) do
    {
      "payee_id" => 1,
      "bank_account_id" => 3,
      "portfolio_code" => "17",
      "agreement_code" => "123456",
      "agreement_code_digit" => "1",
      "name" => "Conta Cobrança",
      "initial_number" => 1,
      "next_number" => 525,
      "end_number" => 5000,
      "status" => "pending",
      "registered_charges" => true,
      "remittance_agreement_code" => 4576361,
      "initial_remittance_number" => 1,
      "remittance_cnab_pattern" => 240,
      "transmission_code" => "1234567",
      "pre_released_billet" => true
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
    let(:token) { "3fa5e9ecc23e477fd7ba3a41063a9fab" }

    it "returns a ChargeConfig instance showed" do
      VCR.use_cassette("charge_configs/show/success") do
        charge_config = subject.show(280)
        expect(charge_config).to be_a(entity_klass)
        expect(charge_config.available_charge_types).to contain_exactly("billet", "credit_card")
      end
    end
  end

  describe "#deactivate" do
    let(:token) { "3fa5e9ecc23e477fd7ba3a41063a9fab" }

    it "returns true" do
      VCR.use_cassette("charge_configs/deactivate/success") do
        result = subject.deactivate(222)
        expect(result).to be_truthy
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
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    context "billet config" do
      it "creates a charge config" do
        VCR.use_cassette("charge_configs/create/billet/success") do
          charge_config = subject.create(billet_params)
          expect(charge_config).to be_a(entity_klass)
          expect(charge_config.agreement_code).to eq(billet_params['agreement_code'])
        end
      end
    end

    context "payment gateway config" do
      context "when gateway is 'cielo'" do
        let(:pgtw_params) do
          {
            name:         "Cielo testing",
            type:         "payment_gateway",
            payee_id:     1,
            gateway_name: "cielo-ws15",
            gateway_id:   "1006993069",
            gateway_key:  "25fbb99741c739dd84d7b06ec78c9bac718838630f30b112d033ce2e621b34f3",
            use_avs:      true
          }
        end

        it "creates a charge config" do
          VCR.use_cassette("charge_configs/create/payment_gateway/cielo/success") do
            charge_config = subject.create(pgtw_params)
            expect(charge_config).to be_a(entity_klass)
            expect(charge_config.name).to eq("Cielo testing")
            expect(charge_config.type).to eq("payment_gateway")
          end
        end
      end

      context "when gateway is 'PJBank'" do
        let(:token) { "3fa5e9ecc23e477fd7ba3a41063a9fab" }
        let(:pgtw_params) do
          {
            name:               "PJBank testing",
            type:               "payment_gateway",
            payee_id:           1,
            gateway_name:       "pjbank",
            gateway_id:         "5c2887642b3acc1604b94baedb972746014ca22b",
            gateway_key:        "6368019b797add1becdb526681019fa82b9de92c",
            billet_gateway_id:  "d3418668b85cea70aa28965eafaf927cd34d004c",
            billet_gateway_key: "46e79d6d5161336afa7b98f01236efacf5d0f24b",
            logo:         {
              "content"      => "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",
              "content_type" => "image/png",
              "filename"     => "logo.png"
            }
          }
        end

        it "creates a charge config" do
          VCR.use_cassette("charge_configs/create/payment_gateway/pjbank/success", match_requests_on: [:body]) do
            charge_config = subject.create(pgtw_params)
            expect(charge_config).to be_a(entity_klass)
            expect(charge_config.name).to eq("PJBank testing")
            expect(charge_config.type).to eq("payment_gateway")
            expect(charge_config.logo_url).to be_a(String)
          end
        end
      end
    end
  end
end
