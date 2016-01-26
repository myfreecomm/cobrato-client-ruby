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

  describe "#charge_accounts" do
    it "returns an instance of Cobrato::Resources::ChargeAccount" do
      expect(subject.charge_accounts).to be_a(Cobrato::Resources::ChargeAccount)
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

end