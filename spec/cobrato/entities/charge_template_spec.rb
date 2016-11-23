require "spec_helper"

describe Cobrato::Entities::ChargeTemplate do

  let(:attributes) do
    {
      id: "1",
      name: "Template novo",
      notification_emails: "fulano@teste.com",
      charged_amount: 456.0,
      due_date: "2016-11-30",
      document_date: "2016-11-30",
      document_number: "45ty67",
      document_kind: "DM",
      charge_config_id: "1",
      instructions: "",
      demonstrative: "",
      registrable: false,
      auto_send_billet: false,
      interest_amount_per_month: "",
      mulct_type: "",
      mulct_value: ""
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :name, :notification_emails, :charged_amount, :due_date, :document_date, :document_number, :document_kind, :charge_config_id, :instructions, :demonstrative, :registrable, :auto_send_billet, :interest_amount_per_month, :mulct_type, :mulct_value]
end
