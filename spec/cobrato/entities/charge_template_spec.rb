require "spec_helper"

describe Cobrato::Entities::ChargeTemplate do

  let(:attributes) do
    {
      id: "1",
      name: "Template novo",
      charged_amount: 456.0,
      document_kind: "DM",
      charge_config_id: "1",
      instructions: "",
      demonstrative: "",
      registrable: false,
      auto_send_billet: false,
      interest_amount_per_month: "",
      mulct_type: "",
      mulct_value: "",
      email_sender_name: "",
      email_subject: "",
      email_text: ""
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :name, :charged_amount, :document_kind, :charge_config_id, :instructions,
    :demonstrative, :registrable, :auto_send_billet, :interest_amount_per_month, :mulct_type, :mulct_value, :email_sender_name,
    :email_subject, :email_text]
end
