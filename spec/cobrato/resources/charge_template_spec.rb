require "spec_helper"

describe Cobrato::Resources::ChargeTemplate do
  let(:http)          { Cobrato::Http.new("9a5457e291da4dc9409437061814a9db") }
  let(:entity_klass)  { Cobrato::Entities::ChargeTemplate }
  let(:params) do
    {
      name: "Template Novo fulano",
      notification_emails: "fulano@teste.com",
      charged_amount: 456.0,
      due_date: "2016-11-30",
      document_date: "2016-11-30",
      document_number: "45ty67",
      document_kind: "DM",
      instructions: "",
      demonstrative: "",
      registrable: false,
      auto_send_billet: false,
      interest_amount_per_month: "",
      mulct_type: "",
      mulct_value: ""
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge templates" do
      VCR.use_cassette("charge_templates/list/success") do
        charge_templates = subject.list(charge_config_id: "1")
        expect(charge_templates).to be_a(Array)
        charge_templates.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    let(:token) { "9a5457e291da4dc9409437061814a9db" }

    it "returns an ChargeTemplate instance show" do
      VCR.use_cassette("charge_templates/show/success") do
        charge_template = subject.show(1, charge_config_id: 1)
        expect(charge_template).to be_a(entity_klass)
      end
    end
  end

  describe "#update" do
    it "returns a ChargeConfig instance updated" do
      VCR.use_cassette("charge_templates/update/success") do
        charge_template = subject.update(1, { name: "Template atualizado" }, charge_config_id: 1)
        expect(charge_template).to be_a(entity_klass)
        expect(charge_template.name).to eq("Template atualizado")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charge_templates/destroy/success") do
        result = subject.destroy(2, charge_config_id: 1)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    let(:token) { "3ef651d88bbaaa5e77ee4768bc793fd4" }

    context "billet config" do
      it "creates a charge config" do
        VCR.use_cassette("charge_templates/create/billet/success") do
          charge_template = subject.create(params, charge_config_id: 1)
          expect(charge_template).to be_a(entity_klass)
        end
      end
    end
  end
end
