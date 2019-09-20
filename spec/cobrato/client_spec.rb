require "spec_helper"

describe Cobrato::Client do
  let(:token) { "45d4e96c707f2a45f73ac9848ff8eeab" } #user login my_favorite_cobrato_user@mailinator.com, passw: 123123
  subject     { described_class.new(token) }

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") do
          expect(subject.authenticated?).to be_truthy
        end
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") do
          expect(subject.authenticated?).to be_falsey
        end
      end
    end
  end

  describe "#companies" do
    it "returns an instance of Cobrato::Resources::Company" do
      expect(subject.companies).to be_a(Cobrato::Resources::Company)
    end
  end

  describe "#payees" do
    it "returns an instance of Cobrato::Resources::Payee" do
      expect(subject.payees).to be_a(Cobrato::Resources::Payee)
    end
  end

  describe "#bank_accounts" do
    it "returns an instance of Cobrato::Resources::BankAccount" do
      expect(subject.bank_accounts).to be_a(Cobrato::Resources::BankAccount)
    end
  end

  describe "#charge_configs" do
    it "returns an instance of Cobrato::Resources::ChargeConfig" do
      expect(subject.charge_configs).to be_a(Cobrato::Resources::ChargeConfig)
    end
  end

  describe "#payment_configs" do
    it "returns an instance of Cobrato::Resources::PaymentConfig" do
      expect(subject.payment_configs).to be_a(Cobrato::Resources::PaymentConfig)
    end
  end

  describe "#charges" do
    it "returns an instance of Cobrato::Resources::Charge" do
      expect(subject.charges).to be_a(Cobrato::Resources::Charge)
    end
  end

  describe "#charging_types" do
    it "returns an instance of Cobrato::Resources::ChargingType" do
      expect(subject.charging_types).to be_a(Cobrato::Resources::ChargingType)
    end
  end

  describe "#regress_cnabs" do
    it "returns an instance of Cobrato::Resources::RegressCnab" do
      expect(subject.regress_cnabs).to be_a(Cobrato::Resources::RegressCnab)
    end
  end

  describe "#remittance_cnabs" do
    it "returns an instance of Cobrato::Resources::RemittanceCnab" do
      expect(subject.remittance_cnabs).to be_a(Cobrato::Resources::RemittanceCnab)
    end
  end

  describe "#credit_cards" do
    it "returns an instance of Cobrato::Resources::CreditCard" do
      expect(subject.credit_cards).to be_a(Cobrato::Resources::CreditCard)
    end
  end

  describe "#payers" do
    it "returns an instance of Cobrato::Resources::Payer" do
      expect(subject.payers).to be_a(Cobrato::Resources::Payer)
    end
  end

  describe "#people" do
    it "returns an instance of Cobrato::Resources::Person" do
      expect(subject.people).to be_a(Cobrato::Resources::Person)
    end
  end

  describe "#charge_templates" do
    it "returns an instance of Cobrato::Resources::ChargeTempalte" do
      expect(subject.charge_templates).to be_a(Cobrato::Resources::ChargeTemplate)
    end
  end

  describe "#payment_methods" do
    it "returns an instance of Cobrato::Resources::PaymentMethod" do
      expect(subject.payment_methods).to be_a(Cobrato::Resources::PaymentMethod)
    end
  end
end
