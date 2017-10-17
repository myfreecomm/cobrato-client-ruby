require "spec_helper"

describe Cobrato::Entities::PaymentConfig do
  let(:attributes) do
    {
      id: 1,
      bank_account_id: 1,
      name: "Configuração de pagamento"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :name, :bank_account_id]
end
