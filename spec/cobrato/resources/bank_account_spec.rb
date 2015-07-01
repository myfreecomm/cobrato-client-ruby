require "spec_helper"

describe Cobrato::Resources::BankAccount do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::BankAccount }
  let(:params) do
    {
      "payee_id" =>  "17",
      "bank_code" =>  "001",
      "agency" =>  "1606",
      "agency_digit" =>  "3",
      "account" =>  "91000",
      "account_digit" =>  "7"
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of bank accounts" do
      VCR.use_cassette("bank_accounts/list/success") do
        bank_accounts = subject.list
        expect(bank_accounts).to be_a(Array)
        bank_accounts.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an BankAccount instance showd" do
      VCR.use_cassette("bank_accounts/show/success") do
        bank_account = subject.show(25)
        expect(bank_account).to be_a(entity_klass)
        expect(bank_account.account).to eq("91000")
      end
    end
  end

  describe "#update" do
    it "returns a BankAccount instance updated" do
      VCR.use_cassette("bank_accounts/update/success") do
        bank_account = subject.update(24, {agency: "1623"})
        expect(bank_account).to be_a(entity_klass)
        expect(bank_account.agency).to eq("1623")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("bank_accounts/destroy/success") do
        result = subject.destroy(24)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a bank account" do
      VCR.use_cassette("bank_accounts/create/success") do
        bank_account = subject.create(params)
        expect(bank_account).to be_a(entity_klass)
        expect(bank_account.account).to eq(params['account'])
      end
    end
  end

  describe "#portfolio_codes" do
    it "returns available portfolio_codes for a BankAccount" do
      VCR.use_cassette("bank_accounts/portfolio_codes/success") do
        portfolio_codes = subject.portfolio_codes(25)
        expect(portfolio_codes).to be_a(Array)
        expect(portfolio_codes).to eq(["11", "12", "16", "17", "18", "31", "51"])
      end
    end
  end
end
