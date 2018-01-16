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
          payee_document_type: 'cpf',
          payee_document: '123.456.789-09',
          payee_name: 'John Doe',
          account: '21500',
          account_digit: '3',
          ted_goal: '00016',
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
          payee_document_type: 'cpf',
          payee_document: '123.456.789-09',
          payee_name: 'John Doe',
          date: Date.new(2017, 12, 26)
        }
      end

      it "creates payment" do
        VCR.use_cassette('payments/billet/create/success') do
          payment = subject.create(params)
          expect(payment).to be_a(entity_klass)
          expect(payment.amount).to eq(14.01)
          expect(payment.due_date).to eq(Date.new(2017, 12, 25))
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
          payment_config_id: 7,
          payment_method: "fgts",
          amount: 1567.85,
          date: Date.new(2017, 10, 31),
          receita_federal_code: "9876",
          barcode: "858000001573 106501791804 107612050819 779937700010",
          fgts_identifier: "3242",
          connectivity_seal: "768768",
          connectivity_seal_digit: "3",
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
end
