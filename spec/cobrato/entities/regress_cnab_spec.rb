require 'spec_helper'

describe Cobrato::Entities::RegressCnab do
  let(:attributes) do
    {
      'id' => 1,
      'charge_config_id' => 1,
      'status' => 'processed',
      'report' => {
        'charge_config_id' => 1,
        'charges' => {
          'not_found_amount' => 1,
          'found_amount' => 0,
          'found' => [],
          'errors_amount' => 0,
          'successes_amount' => 0,
          'total' => 1
        },
        'charge_config' => {
          'id' => 1,
          'bank_account_id' => 1,
          'portfolio_code' => '11',
          'agreement_code' => '1',
          'name' => "Brazil's Bank",
          'agreement_code_digit' => '1',
          'status' => 'pending',
          'billet_file_name' => nil,
          'billet_content_type' => nil,
          'billet_file_size' => nil,
          'billet_updated_at' => nil,
          'initial_number' => 1,
          'next_number' => 1,
          'end_number' => nil,
          'registered_charges' => true,
          'agreement_number' => 1,
          'initial_remittance_number' => 1,
          'current_remittance_number' => nil,
          'remittance_cnab_pattern' => 240,
          'interest_amount_per_month' => nil,
          'mulct_type' => nil,
          'mulct_value' => nil
        },
        'received_charges' => [],
        'registered_charges' => []
      }
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', [:id, :charge_config_id, :status, :report]
end
