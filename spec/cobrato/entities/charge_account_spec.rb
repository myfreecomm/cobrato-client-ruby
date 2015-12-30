require "spec_helper"

describe Cobrato::Entities::ChargeAccount do
  let(:attributes) do
    {
      bank_account_id: 1,
      portfolio_code: "17",
      agreement_code: "123456",
      agreement_code_digit: "1",
      name: "Conta Cobrança",
      initial_number: 1,
      current_number: 1,
      end_number: 1000,
      status: "pending",
      registered_charges: true,
      agreement_number: 4576361,
      initial_remittance_number: 1,
      remittance_cnab_pattern: 240
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :bank_account_id, :portfolio_code, :agreement_code, :agreement_code_digit, :name, :initial_number, :current_number, :end_number, :status, :registered_charges, :agreement_number, :initial_remittance_number, :current_remittance_number, :remittance_cnab_pattern]
end