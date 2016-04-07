require 'spec_helper'

describe Cobrato::Entities::RemittanceCnab do
  let(:attributes) do
    {
      'id' => 1,
      'charge_config_id' => 1,
      'status' => 'processed'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', [:id, :charge_config_id, :status]
end
