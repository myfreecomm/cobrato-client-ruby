require "spec_helper"

describe Cobrato::Resources::ChargeAccount do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::ChargeAccount }
  let(:params) do
    {
      "bank_account_id" => 25,
      "portfolio_code" => "17",
      "agreement_code" => "123456",
      "agreement_code_digit" => "1",
      "name" => "Conta Cobrança",
      "initial_number" => 1,
      "current_number" => 1,
      "end_number" => 1000,
      "status" => "pending",
      "payment_methods" => ["billet", "cnab"]
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of charge accounts" do
      VCR.use_cassette("charge_accounts/list/success") do
        charge_accounts = subject.list
        expect(charge_accounts).to be_a(Array)
        charge_accounts.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an ChargeAccount instance showd" do
      VCR.use_cassette("charge_accounts/show/success") do
        charge_account = subject.show(88)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.agreement_code).to eq("123456")
      end
    end
  end

  describe "#update" do
    it "returns a ChargeAccount instance updated" do
      VCR.use_cassette("charge_accounts/update/success") do
        charge_account = subject.update(88, {end_number: 1337})
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.end_number).to eq(1337)
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("charge_accounts/destroy/success") do
        result = subject.destroy(89)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a charge account" do
      VCR.use_cassette("charge_accounts/create/success") do
        charge_account = subject.create(params)
        expect(charge_account).to be_a(entity_klass)
        expect(charge_account.agreement_code).to eq(params['agreement_code'])
      end
    end
  end
end
