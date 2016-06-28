require "spec_helper"

describe Cobrato::Entities::Charge do
  let(:attributes) do
    {
      id: 1,
      type: "billet",
      charge_config_id: 1,
      due_date: "2015-02-14",
      document_kind: "DV",
      document_date: nil,
      document_number: nil,
      custom_our_number:  "true",
      our_number: "121",
      our_number_digit: nil,
      total_amount: "10.07",
      instructions: "Pagável em qualquer agência até data do vencimento",
      demonstrative: "Demonstrativo",
      payer_emails: ["myemail@gmail.com"],
      received: true,
      received_amount: "10.07",
      received_at: "2015-01-30",
      processing_date: "2015-01-30",
      for_homologation: true,
      registrable: true,
      interest_amount_per_month: 1.02,
      mulct_type: 'percentage',
      mulct_value: 10.12,
      payer_id: 1,
      payer_national_identifier_type: "cpf",
      payer_national_identifier: "12345678909",
      payer_name: "Jonh Doe",
      payer_number: "43",
      payer_complement: "8 andar",
      payer_street: "Rua do Carmo",
      payer_neighbourhood: "Centro",
      payer_zipcode: "22230062",
      payer_city: "Rio de Janeiro",
      payer_state: "RJ",
      registration_status: "without_remittance"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    # common
    :id, :type, :charge_config_id, :total_amount, :payer_emails, :payer_id, :payer_national_identifier_type,
    :payer_national_identifier, :payer_name, :payer_number, :payer_complement, :payer_street, :payer_neighbourhood,
    :payer_zipcode, :payer_city, :payer_state,
    # billet specifics
    :due_date, :processing_date, :document_kind, :document_date, :document_number, :custom_our_number, :our_number,
    :our_number_digit, :instructions, :demonstrative, :received, :received_amount, :received_at, :for_homologation,
    :registrable, :registration_status, :interest_amount_per_month, :mulct_type, :mulct_value,
    # payment gateway specifics
    :credit_card_id, :description, :generate_token, :installments, :payment_gateway_status, :payment_method,
    :soft_descriptor, :payment_gateway_message
  ]
end
