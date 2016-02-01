require 'spec_helper'

describe Cobrato::Entities::RemittanceCnab do
  let(:attributes) do
    {
      'id' => 1,
      'charge_account_id' => 1,
      'status' => 'processed'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', [:id, :charge_account_id, :status]
end
