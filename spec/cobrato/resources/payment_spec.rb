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
    it "returns an array of payments" do
      VCR.use_cassette("payments/list/success") do
        payments = subject.list
        expect(payments).to be_a(Array)
        payments.each do |e|
          expect(e).to be_a(entity_klass)
        end
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

  describe "#update" do
    it "returns a Payment instance updated" do
      VCR.use_cassette("payments/update/success") do
        payment = subject.update(10, { amount: '125.99' })
        expect(payment).to be_a(entity_klass)
        expect(payment.amount).to eq(125.99)
      end
    end
  end

  describe "#show" do
    it "returns an Payment instance showed" do
      VCR.use_cassette("payments/show/success") do
        payment = subject.show(10)
        expect(payment).to be_a(entity_klass)
        expect(payment.amount).to eq(456.78)
      end
    end
  end

  describe "#create" do
    context "when transfer" do
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
          account: '21500',
          account_digit: '3',
          ted_goal: '00016',
          payee: {
            national_identifier_type: 'cpf',
            national_identifier: '123.456.789-09',
            name: 'John Doe',
          }
        }
      end

      it "creates a payment" do
        VCR.use_cassette("payments/transfer/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(69.55)
        end
      end
    end

    context "when billet" do
      let(:params) do
        {
          payment_config_id: 1,
          payment_type: 'other',
          payment_method: 'billet_other_bank',
          barcode: '00190.00009 03055.582005 00000.002121 4 73840000001401',
          date: Date.new(2017, 12, 26),
          due_date: Date.new(2018, 12, 26),
          agency: "3456",
          account: "23400",
          account_digit: "1",
          payee: {
            national_identifier_type: 'cpf',
            national_identifier: '123.456.789-09',
            name: 'John Doe',
          }
        }
      end

      it "creates payment" do
        VCR.use_cassette('payments/billet/create/success') do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(14.01)
          expect(payment.due_date).to eq(Date.new(2018, 12, 26))
          expect(payment.payment_method).to eq('billet_other_bank')
        end
      end
    end

    context "when tribute with barcode" do
      let(:params) do
        {
          payment_config_id: 1,
          payment_type: 'tribute',
          payment_method: 'tribute_with_barcode',
          barcode: '85620000000-3 18940064729-4 81157833510-100181097273-5',
          due_date: Date.new(2017, 10, 25),
          date: Date.new(2017, 10, 25),
        }
      end

      it "creates payment" do
        VCR.use_cassette('payments/tribute_with_barcode/create/success') do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(18.94)
          expect(payment.due_date).to eq(Date.new(2017, 10, 25))
          expect(payment.payment_method).to eq('tribute_with_barcode')
        end
      end
    end

    context "when darf" do
      let(:params) do
        {
          payment_config_id: 1,
          payment_method: "darf",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          due_date: Date.new(2017, 10, 31),
          calculation_period: Date.new(2017, 9, 30),
          receita_federal_code: "0571",
        }
      end

      it "creates payment" do
        VCR.use_cassette("payments/darf/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.due_date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("darf")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end

    context "when das" do
      let(:params) do
        {
          payment_config_id: 7,
          payment_method: "das",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          due_date: Date.new(2017, 10, 31),
          calculation_period: Date.new(2017, 9, 30),
          receita_federal_code: "0571",
          gross_revenue: 45.0,
          gross_revenue_percentage: 0.07,
        }
      end

      it "creates payment" do
        VCR.use_cassette("payments/das/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.due_date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("das")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end

    context "when ipva" do
      let(:params) do
        {
          payment_config_id: 7,
          payment_method: "ipva",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          due_date: Date.new(2017, 10, 31),
          city_code: 56,
          discount_amount: 0.03,
          competency_year: "2018",
          license_plate: "KQT7890",
          payment_option: "single_with_discount",
          renavam: "345352",
          uf: "rj",
        }
      end
      it "creates payment" do
        VCR.use_cassette("payments/ipva/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.due_date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("ipva")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end

    context "when icms_sp" do
      let(:params) do
        {
          payment_config_id: 7,
          payment_method: "icms_sp",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          due_date: Date.new(2017, 10, 31),
          receita_federal_code: "4531",
          competency_month: "05",
          competency_year: "2018",
          state_registration: "423",
          active_debt_registration: "3421",
          installment_number: "3",
          mulct_amount: 0.4,
          interest_amount: 0.02,
        }
      end
      it "creates payment" do
        VCR.use_cassette("payments/icms_sp/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.due_date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("icms_sp")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end

    context "when dpvat" do
      let(:params) do
        {
          payment_config_id: 7,
          payment_method: "dpvat",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          due_date: Date.new(2017, 10, 31),
          city_code: 56,
          discount_amount: 0.03,
          competency_year: "2018",
          license_plate: "KQT7890",
          renavam: "345352",
          uf: "rj",
        }
      end

      it "creates payment" do
        VCR.use_cassette("payments/dpvat/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.due_date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("dpvat")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end

    context "when fgts" do
      let(:params) do
        {
          payment_config_id: 1,
          payment_method: "fgts",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          barcode: "858000001573 106501791804 107612050819 779937700010",
          taxpayer_document: "14610600000186",
          taxpayer_document_type: "cnpj"
        }
      end

      it "creates payment" do
        VCR.use_cassette("payments/fgts/create/success") do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(1567.85)
          expect(payment.date).to eq(Date.new(2017, 10, 31))
          expect(payment.payment_method).to eq("fgts")
          expect(payment.payment_type).to eq("tribute")
        end
      end
    end
  end

  describe "#cancel" do
    it "returns ok" do
      VCR.use_cassette("payments/cancel/success") do
        charge = subject.cancel(63)
        expect(charge).to be_a(entity_klass)
        expect(charge.id).to eql(63)
        expect(charge.registration_status).to eql("cancelation_started")
      end
    end

    context "when the payment is not cancelable" do
      it "returns false" do
        VCR.use_cassette("payments/cancel/fail") do
          expect{ subject.cancel(65) }.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end

  describe "#schema" do
    context "when success" do
      context "when billet" do
        it "returns the json schema as a hash" do
          VCR.use_cassette("payments/schema/success/billet") do
            schema = subject.schema(payment_config_id: 1, barcode: "00190.00009 03055.582005 00000.001115 1 73770000000711")
            expect(schema).to be_a(Hash)
            expect(schema.dig("schema", "properties", "barcode", "default")).to eql("00190.00009 03055.582005 00000.001115 1 73770000000711")
            expect(schema.dig("schema", "properties", "payment_config_id", "default")).to eql(1)
            expect(schema.dig("schema", "properties", "payment_method", "default")).to eql("billet_other_bank")
            expect(schema.dig("form", "payee_document_type", "tag")).to eql("select")
          end
        end
      end

      context "when ted_other_ownership" do
        it "returns the json schema as a hash" do
          VCR.use_cassette("payments/schema/success/ted_other_ownership") do
            schema = subject.schema(payment_config_id: 1, payment_method: "ted_other_ownership")
            expect(schema).to be_a(Hash)
            expect(schema.dig("schema", "properties", "payment_config_id", "default")).to eql(1)
            expect(schema.dig("schema", "properties", "payment_method", "default")).to eql("ted_other_ownership")
            expect(schema.dig("schema", "properties", "ted_goal", "enum")).to be_an(Array)
            expect(schema.dig("form", "payee_document_type", "tag")).to eql("select")
          end
        end
      end
    end

    context "when failure" do
      it "raises an error" do
        VCR.use_cassette("payments/schema/fail") do
          expect{ subject.schema(payment_config_id: 1) }.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end

  describe "#unauthorize" do
    it "returns ok" do
      VCR.use_cassette("payments/unauthorize/success") do
        charge = subject.unauthorize(49)
        expect(charge).to be_a(entity_klass)
        expect(charge.id).to eql(49)
        expect(charge.registration_status).to eql("unauthorized")
      end
    end

    context "when the payment is not unauthorizable" do
      it "returns false" do
        VCR.use_cassette("payments/unauthorize/fail") do
          expect{ subject.unauthorize(77) }.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end

  describe "#reschedule" do
    it "returns ok" do
      VCR.use_cassette("payments/reschedule/success") do
        charge = subject.reschedule(100, { date: Date.new(2018, 10, 2) })
        expect(charge).to be_a(entity_klass)
        expect(charge.id).to eql(100)
        expect(charge.registration_status).to eql("reschedule_started")
      end
    end

    context "when the payment can not be rescheduled" do
      it "returns false" do
        VCR.use_cassette("payments/reschedule/fail") do
          expect do
            charge = subject.reschedule(49, { date: Date.new(2018, 10, 2) })
          end.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end

  describe "#register_error" do
    it "returns ok" do
      VCR.use_cassette("payments/register_error/success") do
        charge = subject.register_error(53)
        expect(charge).to be_a(entity_klass)
        expect(charge.id).to eql(53)
        expect(charge.registration_status).to eql("registered_with_error")
      end
    end

    context "when the payment is can not register error" do
      it "returns false" do
        VCR.use_cassette("payments/register_error/fail") do
          expect{ subject.register_error(53) }.to raise_error(Cobrato::RequestError)
        end
      end
    end
  end
end
