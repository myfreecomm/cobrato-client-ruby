require "spec_helper"

describe Cobrato::Resources::Charge do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::Charge }
  let(:params) do
    {
      "charge_config_id" => 88,
      "due_date" => "2015-02-14",
      "document_kind" => "DV",
      "document_date" => nil,
      "document_number" => 'NA',
      "custom_our_number" => true,
      "our_number" => "122",
      "our_number_digit" => nil,
      "total_amount" => "10.07",
      "instructions" => "Pagável em qualquer agência até data do vencimento",
      "demonstrative" => "Demonstrativo",
      "payer_emails" => ["myemail@gmail.com"],
      "payer_info" => "Empresa A - CNPJ X",
      "processing_date" => "2015-01-30",
      "for_homologation" => true,
      "registered" => true,
      "payer_national_identifier_type" => "cpf",
      "payer_national_identifier" => "12345678909",
      "payer_name" => "Jonh Doe",
      "payer_number" => "43",
      "payer_complement" => "8 andar",
      "payer_street" => "Rua do Carmo",
      "payer_neighbourhood" => "Centro",
      "payer_zipcode" => "22230062",
      "payer_city" => "Rio de Janeiro",
      "payer_state" => "RJ"
    }
  end

  let(:receive_params) do
    {
      "received_amount" => "10.07",
      "received_at" => "2015-01-30"
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charges" do
      VCR.use_cassette("charges/list/success") do
        charges = subject.list
        expect(charges).to be_a(Array)
        charges.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an Charge instance showd" do
      VCR.use_cassette("charges/show/success") do
        charge = subject.show(87)
        expect(charge).to be_a(entity_klass)
        expect(charge.our_number).to eq("121")
      end
    end
  end

  describe "#update" do
    it "returns a Charge instance updated" do
      VCR.use_cassette("charges/update/success") do
        charge = subject.update(87, {document_number: "1337"})
        expect(charge).to be_a(entity_klass)
        expect(charge.document_number).to eq("1337")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charges/destroy/success") do
        result = subject.destroy(88)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a charge" do
      VCR.use_cassette("charges/create/success") do
        charge = subject.create(params)
        expect(charge).to be_a(entity_klass)
        expect(charge.our_number).to eq(params['our_number'])
      end
    end
  end

  describe "#receive" do
    it "returns a Charge received charge" do
      VCR.use_cassette("charges/receive/success") do
        charge = subject.receive(87, receive_params)
        expect(charge).to be_a(entity_klass)
        expect(charge.received_amount).to eq(10.07)
        expect(charge.received).to eq(true)
      end
    end
  end

  describe "#undo_receive" do
    it "returns a Charge not received charge" do
      VCR.use_cassette("charges/undo_receive/success") do
        charge = subject.undo_receive(87)
        expect(charge).to be_a(entity_klass)
        expect(charge.received).to eq(false)
      end
    end
  end

  describe "#deliver_billet" do
    context "without informing emails" do
      it "returns true" do
        VCR.use_cassette("charges/deliver_billet/success") do
          result = subject.deliver_billet(87)
          expect(result).to be_truthy
        end
      end
    end

    context "informing emails" do
      it "returns true" do
        VCR.use_cassette("charges/deliver_billet/informing_emails") do
          result = subject.deliver_billet(87, ["cobratoone@mailinator.com", "cobratotest@mailinator.com"])
          expect(result).to be_truthy
        end
      end
    end
  end

  describe "#billet" do
    it "returns a simple struct with the Charge billet url" do
      VCR.use_cassette("charges/billet/success") do
        billet = subject.billet(87)
        expect(billet).to be_a(OpenStruct)
        expect(billet.url).to match("https://.*s3.amazonaws.com.*\.pdf")
      end
    end
  end
end
