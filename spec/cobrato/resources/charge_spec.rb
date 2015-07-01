require "spec_helper"

describe Cobrato::Resources::Charge do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::Charge }
  let(:params) do
    {
      "charge_account_id" => 88,
      "due_date" => "2015-02-14",
      "document_kind" => "DV",
      "document_date" => nil,
      "document_number" => nil,
      "custom_our_number" => true,
      "our_number" => "122",
      "our_number_digit" => nil,
      "total_amount" => "10.07",
      "instructions" => "Pagável em qualquer agência até data do vencimento",
      "demonstrative" => "Demonstrativo",
      "payer_emails" => ["myemail@gmail.com"],
      "processing_date" => "2015-01-30",
      "for_homologation" => true,
      "billet" => "https://cobrato-billet-storage.s3.amazonaws.com/"
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
        charge_account = subject.show(87)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.our_number).to eq("121")
      end
    end
  end

  describe "#update" do
    it "returns a Charge instance updated" do
      VCR.use_cassette("charges/update/success") do
        charge_account = subject.update(87, {document_number: "1337"})
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.document_number).to eq("1337")
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
        charge_account = subject.create(params)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.our_number).to eq(params[:our_number])
      end
    end
  end

  describe "#receive" do
    it "returns a Charge received charge" do
      VCR.use_cassette("charges/receive/success") do
        charge_account = subject.receive(87, receive_params)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.received_amount).to eq(10.07)
        expect(charge_account.received).to eq(true)
      end
    end
  end

  describe "#undo_receive" do
    it "returns a Charge not received charge" do
      VCR.use_cassette("charges/undo_receive/success") do
        charge_account = subject.undo_receive(87)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.received).to eq(false)
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
end
