require "spec_helper"

describe Cobrato::Entities::Charge do
  let(:attributes) do
    {
      id: 1,
      charge_account_id: 1,
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
      billet: "https://cobrato-billet-storage.s3.amazonaws.com/"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :charge_account_id, :due_date, :document_kind, :document_date, :document_number, :custom_our_number, :our_number, :our_number_digit, :total_amount, :instructions, :demonstrative, :payer_emails, :received, :received_amount, :received_at, :processing_date, :for_homologation, :billet]
end