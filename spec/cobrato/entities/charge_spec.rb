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
      notification_emails: ["myemail@gmail.com"],
      received: true,
      received_amount: "10.07",
      received_at: "2015-01-30",
      processing_date: "2015-01-30",
      for_homologation: true,
      registrable: true,
      interest_amount_per_month: 1.02,
      mulct_type: 'percentage',
      mulct_value: 10.12,
      payment_tax: 2.50,
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
      registration_status: "without_remittance",
      canceled_at: "2015-01-31T17:46:01.253Z",
      charge_template_id: "1",
      email_sender_name: "John",
      email_subject: "Email subject",
      email_text: "Text for email body",
      gateway_id: "4569",
      billet_link: "http://billet_link.com.br/billet_link",
      barcode: "00190.00009 03055.582005 00000.002121 4 73840000001401",
      paid_at: "2018-07-13T00:55:38.961Z",
      discount_amount: 0.0,
      title: "Title for charge",
      cashback_amount: 12.50,
      qr_code_link: "https://api.hml.amedigital.com/api/qrcode?qrcode=eyJ0eXBlIjoiUEFZTUVOVCIsIm9yZGVyX2lkIjoiMjY3YTNhZjMtMTJkMy00MjAwLWJmYWEtMWY2OTAxYTRmMmQ0In0=",
      deep_link: "amedigital://payment?qrcode=eyJ0eXBlIjoiUEFZTUVOVCIsIm9yZGVyX2lkIjoiMjY3YTNhZjMtMTJkMy00MjAwLWJmYWEtMWY2OTAxYTRmMmQ0In0=",
      order_status: "pending"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    # common
    :id, :type, :charge_config_id, :charged_amount, :notification_emails, :payer_id, :payer_national_identifier_type,
    :payer_national_identifier, :payer_name, :payer_number, :payer_complement, :payer_street, :payer_neighbourhood,
    :payer_zipcode, :payer_city, :payer_state, :for_homologation, :canceled_at, :paid_amount, :paid_at,
    :total_amount, :received, :received_amount, :payment_gateway_message,:auto_send_billet, :email_sender_name,
    :email_subject, :email_text, :available_billet, :received_at, # deprecated
    # billet specifics
    :due_date, :processing_date, :document_kind, :document_date, :document_number, :custom_our_number, :our_number,
    :our_number_digit, :instructions, :demonstrative, :registrable, :payment_tax,
    :registration_status, :interest_amount_per_month, :mulct_type, :mulct_value, :charge_template_id, :paid_discount,
    :paid_additions, :paid_rebate, :paid_difference,
    # payment gateway specifics
    :credit_card_id, :description, :installments, :payment_gateway_status, :payment_method, :soft_descriptor,
    # gateway billet specifics
    :discount_amount,
    # wallet specifics
    :title, :cashback_amount, :qr_code_link, :deep_link, :order_status]
end
