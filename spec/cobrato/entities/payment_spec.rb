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
      registration_status: 'without_remittance',
      payee_document_type: 'cpf',
      payee_document: '123.456.789-09',
      payee_name: 'John Doe',

      agency: '9358',
      account: '21500',
      account_digit: '3',
      doc_goal: '11',
      ted_goal: '00016',

      discount_amount: 0.5,
      extra_amount: 0.2,
      due_date: Date.new(2017, 12, 29),
      barcode: "83630000000 4 25530100000 6 00005094828 0 09112017110 2"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes',
    [
      :id, :payment_config_id, :payment_type, :payment_method, :amount, :date, :registration_status, :our_number, :bank_code,
      :payee_document_type, :payee_document, :payee_name,

      # Transfer specific
      :agency, :account, :account_digit, :doc_goal, :ted_goal,

      # Billet specific
      :discount_amount, :extra_amount, :due_date, :barcode
    ]
end
