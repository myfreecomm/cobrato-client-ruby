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
      payer_info: "Empresa A - CNPJ X",
      received: true,
      received_amount: "10.07",
      received_at: "2015-01-30",
      processing_date: "2015-01-30",
      for_homologation: true,
      payment_method: "billet",
      has_cnab_remittance: false,
      _links: [
        { rel: "self",   method: "GET", href: "https://app.cobrato.com/api/v1/charges/1" },
        { rel: "update", method: "PUT", href: "https://app.cobrato.com/api/v1/charges/1" },
        { rel: "billet", method: "GET", href: "http://localhost:3000/charges/1/download_billet" }
      ]
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :charge_account_id, :due_date, :document_kind, :document_date, :document_number, :custom_our_number, :our_number, :our_number_digit, :total_amount, :instructions, :demonstrative, :payer_emails, :received, :received_amount, :received_at, :processing_date, :for_homologation, :payer_info, :payment_method, :has_cnab_remittance, :billet_url]

  context '#initialize' do
    it "should set the corret billet_url based on links" do
      expect(subject.billet_url).to eql("http://localhost:3000/charges/1/download_billet")
    end
  end
end