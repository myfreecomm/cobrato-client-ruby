require "spec_helper"

describe Cobrato::Entities::PaymentConfig do
  let(:attributes) do
    {
      payee_id: 1,
      bank_account_id: 1,
      name: "Configuração de pagamento"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :name, :payee_id, :bank_account_id]
end
