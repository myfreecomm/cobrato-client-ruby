require "spec_helper"

describe Cobrato::Entities::BankAccount do
  let(:attributes) do
    {
      company_id: "1",
      payee_id: "1",
      bank_code: "001",
      agency: "1606",
      agency_digit: "3",
      account: "91000",
      account_digit: "7"
    }
  end

  subject { described_class.new(attributes) }

  describe '#payee_id' do
    it 'print a deprecation warning' do
      expect do
        subject.payee_id
      end.to output("Warning: 'payee_id' is deprecated. Use 'company_id' instead.\n").to_stdout
    end
  end

  it_behaves_like "entity_attributes", %i[id payee_id company_id bank_code agency_digit agency account account_digit]
end
