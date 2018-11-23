require "spec_helper"

describe Cobrato::Entities::PaymentMethod do
  let(:attributes) do
    {
      identifier: "dpvat",
      group:  "tribute",
      label: "DPVAT"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:identifier, :group, :label]
end
