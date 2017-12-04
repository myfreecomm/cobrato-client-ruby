require 'spec_helper'

describe Cobrato::Entities::Payment do
  let(:attributes) do
    {
      id: 5,
      payment_config_id: 1,
      payment_type: 'provider',
      payment_method: 'ted_other_ownership',
      amount: 69.55,
      date: Date.new(2017, 12, 3),
      our_number: '456789',
      bank_code: '341',
      agency: '9358',
      payee_document_type: 'cpf',
      payee_document: '123.456.789-09',
      payee_name: 'John Doe',
      account: '21500',
      account_digit: '3',
      doc_goal: '11',
      ted_goal: '00016',
      registration_status: 'without_remittance',

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes',
    [:id, :payment_config_id, :payment_type, :payment_method, :amount, :date, :bank_code, :agency, :payee_document_type,
    :payee_document, :payee_name, :account, :account_digit, :doc_goal, :ted_goal, :registration_status, :our_number]
end
