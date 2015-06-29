require "spec_helper"

describe Cobrato::Entities::BankAccount do
  let(:attributes) do
    {
      payee_id: "1",
      bank_code: "001",
      agency: "1606",
      agency_digit: "3",
      account: "91000",
      account_digit: "7"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :payee_id, :bank_code, :agency_digit, :agency, :account, :account_digit]
end