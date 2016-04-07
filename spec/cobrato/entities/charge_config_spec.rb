require "spec_helper"

describe Cobrato::Entities::ChargeConfig do
  let(:attributes) do
    {
      bank_account_id: 1,
      type: "billet",
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
      remittance_cnab_pattern: 240,
      interest_amount_per_month: 1.02,
      mulct_type: 'percentage',
      mulct_value: 10.12,
      transmission_code: "1234567"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :type, :bank_account_id, :portfolio_code, :agreement_code, :agreement_code_digit, :name, :initial_number, :current_number, :end_number, :status, :registered_charges, :agreement_number, :initial_remittance_number, :current_remittance_number, :remittance_cnab_pattern, :interest_amount_per_month, :mulct_type, :mulct_value, :transmission_code]
end