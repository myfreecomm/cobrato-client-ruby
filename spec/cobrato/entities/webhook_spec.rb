require "spec_helper"

describe Cobrato::Entities::Webhook do
  let(:attributes) do
    {
      name: "RSpec Subject",
      url:  "http://requestb.in/1mayrfq1"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :description, :url, :secret]
end
