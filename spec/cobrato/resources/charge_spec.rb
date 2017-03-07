require "spec_helper"

describe Cobrato::Resources::Charge do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::Charge }

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

    context "filtering" do
      let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

      it "returns an array of charges" do
        VCR.use_cassette("charges/list/filtering-success") do
          charges = subject.list(charge_config_ids: [10, 31])
          expect(charges).to be_a(Array)
          expect(charges.size).to eql(3)
          charges.each do |e|
            expect(e).to be_a(entity_klass)
          end
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
        charge = subject.update(1913, {document_number: "1337"})
        expect(charge).to be_a(entity_klass)
        expect(charge.document_number).to eq("1337")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charges/destroy/success") do
        result = subject.destroy(1913)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

    context "billet charge" do
      let(:params) do
        {
          "charge_config_id" => 11,
          "due_date" => "2015-02-14",
          "document_kind" => "DV",
          "document_date" => nil,
          "document_number" => 'NA',
          "charged_amount" => "10.07",
          "instructions" => "Pagável em qualquer agência até data do vencimento",
          "demonstrative" => "Demonstrativo",
          "notification_emails" => ["myemail@gmail.com"],
          "processing_date" => "2015-01-30",
          "registrable" => false,
          "payer_attributes" => {
            "national_identifier_type" => "cpf",
            "national_identifier" => "12345678909",
            "name" => "Jonh Doe",
            "number" => "43",
            "complement" => "8 andar",
            "street" => "Rua do Carmo",
            "neighbourhood" => "Centro",
            "zipcode" => "22230062",
            "city" => "Rio de Janeiro",
            "state" => "RJ"
          }
        }
      end

      it "creates a charge" do
        VCR.use_cassette("charges/create/billet_charge/success") do
          charge = subject.create(params)
          expect(charge).to be_a(entity_klass)
          expect(charge.our_number).to eq("411")
          expect(charge.charged_amount).to eq(10.07)
        end
      end

      context "when using charge template" do
        let(:http) { Cobrato::Http.new("9a5457e291da4dc9409437061814a9db") }
        let(:params) do
          {
            "charge_config_id" => 1,
            "charge_template_id" => 1,
            "processing_date" => "2015-01-30",
            "registrable" => false,
            "charged_amount" => 10.07,
            "due_date" => "2016-11-9",
            "payer_attributes" => {
              "national_identifier_type" => "cpf",
              "national_identifier" => "12345678909",
              "name" => "Jonh Doe",
              "number" => "43",
              "complement" => "8 andar",
              "street" => "Rua do Carmo",
              "neighbourhood" => "Centro",
              "zipcode" => "22230062",
              "city" => "Rio de Janeiro",
              "state" => "RJ"
            }
          }
        end

        it "creates a charge" do
          VCR.use_cassette("charges/create/billet_charge/with_template/success") do
            charge = subject.create(params)
            expect(charge).to be_a(entity_klass)
            expect(charge.charged_amount).to eq(10.07)
          end
        end
      end

      context "with deprecated total_amount" do
        before { params[:total_amount] = params.delete(:charged_amount) }

        it "creates a charge" do
          VCR.use_cassette("charges/create/billet_charge/success-deprecated") do
            charge = subject.create(params)
            expect(charge).to be_a(entity_klass)
            expect(charge.our_number).to eq("412")
            expect(charge.total_amount).to eq(10.07)
            expect(charge.charged_amount).to eq(10.07)
          end
        end
      end
    end

    context "payment gateway charge" do
      let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }
      let(:params) do
        {
          charge_config_id: 7,
          charged_amount: 721.0,
          payment_method: "credit_card_financed",
          installments: 3,
          credit_card_id: 13,
          payer_attributes: {
            national_identifier_type: "cpf",
            national_identifier: "12345678909",
            name: "Jonh Doe",
          }
        }
      end

      it "creates a charge" do
        VCR.use_cassette("charges/create/payment_gateway/success") do
          charge = subject.create(params)
          expect(charge).to be_a(entity_klass)
          expect(charge.charged_amount).to eq(721.0)
          expect(charge.type).to eq("payment_gateway")
        end
      end

      context "with deprecated total_amount" do
        before { params[:total_amount] = params.delete(:charged_amount) }

        it "creates a charge" do
          VCR.use_cassette("charges/create/payment_gateway/success-deprecated") do
            charge = subject.create(params)
            expect(charge).to be_a(entity_klass)
            expect(charge.charged_amount).to eq(721.0)
            expect(charge.total_amount).to eq(721.0)
            expect(charge.type).to eq("payment_gateway")
          end
        end
      end
    end
  end

  describe "#receive" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }
    let(:receive_params) do
      {
        "paid_amount" => "10.07",
        "paid_at" => "2015-01-30",
        "payment_tax" => "2.50",
        "paid_discount" => "4.56",
        "paid_additions" => "0.50",
        "paid_rebate" => "0.30"
      }
    end

    it "returns a Charge received charge" do
      VCR.use_cassette("charges/receive/success") do
        charge = subject.receive(607, receive_params)
        expect(charge).to be_a(entity_klass)
        expect(charge.paid_amount).to eq(10.07)
        expect(charge.payment_tax).to eq(2.5)
        expect(charge.paid_additions).to eq(0.5)
      end
    end

    context "receive with DEPRECATED" do
      let(:receive_params) do
        {
          "received_amount" => "10.07",
          "received_at" => "2015-01-30"
        }
      end

      it "returns a Charge received charge" do
        VCR.use_cassette("charges/receive/success-deprecated") do
          charge = subject.receive(518, receive_params)
          expect(charge).to be_a(entity_klass)
          expect(charge.received_amount).to eq(10.07)
          expect(charge.received).to eq(true)
        end
      end
    end
  end

  describe "#undo_receive" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

    it "returns a Charge not received charge" do
      VCR.use_cassette("charges/undo_receive/success") do
        charge = subject.undo_receive(518)
        expect(charge).to be_a(entity_klass)
        expect(charge.received_at).to eq(nil)
      end
    end

    context "undo with DEPRECATED" do
      it "returns a Charge not received charge" do
        VCR.use_cassette("charges/undo_receive/success-deprecated") do
          charge = subject.undo_receive(518)
          expect(charge).to be_a(entity_klass)
          expect(charge.received).to eq(false)
        end
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

  describe "#cancel" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

    it "returns the charge" do
      VCR.use_cassette("charges/cancel/success") do
        charge = subject.cancel(612)
        expect(charge).to be_a(entity_klass)
      end
    end
  end

  describe "#revoke" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

    context "when the charge is destroyed" do
      it "returns true" do
        VCR.use_cassette("charges/revoke/destroy_success") do
          expect(subject.revoke(619)).to eql(true)
        end
      end
    end

    context "when the charge is canceled" do
      it "returns the charge" do
        VCR.use_cassette("charges/revoke/cancel_success") do
          charge = subject.revoke(525)
          expect(charge).to be_a(entity_klass)
        end
      end
    end

    context "when cannot be canceled nor destroyed" do
      it "returns false" do
        VCR.use_cassette("charges/revoke/fail") do
          expect{ subject.revoke(611) }.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end

  describe "#retry" do
    let(:http) { Cobrato::Http.new("3ef651d88bbaaa5e77ee4768bc793fd4") }

    it "queue the Charge for retrying" do
      VCR.use_cassette("charges/retry/success") do
        expect(subject.retry(46)).to eql(true)
      end
    end
  end

  describe "#renew" do
    let(:renewal_params) do
      {
        "new_due_date" => "20/01/2017"
      }
    end

    it "returns a Charge renewed charge" do
      VCR.use_cassette("charges/renew/success") do
        charge = subject.renew(73, renewal_params)
        expect(charge).to be_a(entity_klass)
      end
    end
  end
end
