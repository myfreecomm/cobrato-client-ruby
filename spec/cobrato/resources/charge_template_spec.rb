require "spec_helper"

describe Cobrato::Resources::ChargeTemplate do
  let(:token)        { "3ef651d88bbaaa5e77ee4768bc793fd4" }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::ChargeTemplate }
  let(:params) do
    {
      name: "Special Customer",
      charged_amount: 456.0,
      document_kind: "DM",
      instructions: "",
      demonstrative: "",
      registrable: false,
      auto_send_billet: false,
      interest_amount_per_month: "",
      mulct_type: "",
      mulct_value: "",
      charge_config_id: 11
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge templates" do
      VCR.use_cassette("charge_templates/list/success") do
        charge_templates = subject.list
        expect(charge_templates).to be_a(Array)
        charge_templates.each do |e|
          expect(e).to be_a(entity_klass)
        end
        expect(charge_templates.size).to eql(3)
      end
    end

    it "list filtering by charge_config_id" do
      VCR.use_cassette("charge_templates/list/success-filtering") do
        charge_templates = subject.list(charge_config_id: 11)
        expect(charge_templates.size).to eql(2)
        charge_config_ids = charge_templates.map(&:charge_config_id).uniq
        expect(charge_config_ids.size).to eql(1)
        expect(charge_config_ids.first).to eql(11)
      end
    end
  end

  describe "#show" do
    it "returns an ChargeTemplate instance show" do
      VCR.use_cassette("charge_templates/show/success") do
        charge_template = subject.show(3)
        expect(charge_template).to be_a(entity_klass)
      end
    end
  end

  describe "#update" do
    it "returns a ChargeConfig instance updated" do
      VCR.use_cassette("charge_templates/update/success") do
        charge_template = subject.update(2, { name: "Template atualizado" })
        expect(charge_template).to be_a(entity_klass)
        expect(charge_template.name).to eq("Template atualizado")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charge_templates/destroy/success") do
        result = subject.destroy(1)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    context "billet config" do
      it "creates a charge config" do
        VCR.use_cassette("charge_templates/create/billet/success") do
          charge_template = subject.create(params)
          expect(charge_template).to be_a(entity_klass)
        end
      end
    end
  end
end
