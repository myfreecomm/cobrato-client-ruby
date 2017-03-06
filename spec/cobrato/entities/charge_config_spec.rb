require "spec_helper"

describe Cobrato::Entities::ChargeConfig do
  let(:attributes) do
    {
      payee_id: 1,
      bank_account_id: 1,
      type: "billet",
      portfolio_code: "17",
      agreement_code: "123456",
      agreement_code_digit: "1",
      name: "Conta Cobrança",
      initial_number: 1,
      next_number: 1,
      end_number: 1000,
      status: "pending",
      registered_charges: true,
      remittance_agreement_code: 4576361,
      initial_remittance_number: 1,
      remittance_cnab_pattern: 240,
      transmission_code: "1234567",
      pre_released_billet: false
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    # common
    :id, :type, :name, :status, :payee_id,
    # billet specifics
    :bank_account_id, :portfolio_code, :agreement_code, :agreement_code_digit, :initial_number, :next_number,
    :end_number, :registered_charges, :remittance_agreement_code, :initial_remittance_number, :current_remittance_number,
    :remittance_cnab_pattern, :transmission_code, :pre_released_billet,
    # payment gateway specifics
    :gateway_id, :gateway_key, :gateway_name, :use_avs]
end
