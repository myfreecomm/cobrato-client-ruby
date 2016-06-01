require "spec_helper"

describe Cobrato::Entities::BankBillet do
  let(:attributes) do
    {
      bank_code: "001",
      bank_name: "BancoDoBrasil",
      portfolio_codes: %w[11 12 16 17 18 31 51],
      regress: true,
      remittance: false
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:bank_code, :bank_name, :portfolio_codes, :regress, :remittance]
end
