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
      payer_info: "Empresa A - CNPJ X",
      received: true,
      received_amount: "10.07",
      received_at: "2015-01-30",
      processing_date: "2015-01-30",
      for_homologation: true,
      registrable: true,
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

  it_behaves_like "entity_attributes", [:id, :type, :charge_config_id, :due_date, :document_kind, :document_date, :document_number, :custom_our_number, :our_number, :our_number_digit, :total_amount, :instructions, :demonstrative, :payer_emails, :received, :received_amount, :received_at, :processing_date, :for_homologation, :payer_info, :registrable, :registration_status, :payer_national_identifier_type, :payer_national_identifier, :payer_name, :payer_number, :payer_complement, :payer_street, :payer_neighbourhood, :payer_zipcode, :payer_city, :payer_state]
end
