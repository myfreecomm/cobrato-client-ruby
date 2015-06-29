require "spec_helper"

describe Cobrato::Resources::Webhook do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::Webhook }
  let(:params) do
    {
      url:  "http://requestb.in/vp301qvp",
      description: "My Fake Webhook"
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of Webhooks" do
      VCR.use_cassette("webhooks/list/success") do
        webhooks = subject.list
        expect(webhooks).to be_a(Array)
        webhooks.each do |e|
          expect(e).to be_a(entity_klass )
        end
      end
    end
  end

  describe "#update" do
    it "returns an Webhook instance updated" do
      VCR.use_cassette("webhooks/update/success") do
        webhook = subject.update(8, {description: "RSpec integration"})
        expect(webhook).to be_a(entity_klass)
        expect(webhook.description).to eq("RSpec integration")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("webhooks/destroy/success") do
        result = subject.destroy(7)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates an webhook" do
      VCR.use_cassette("webhooks/create/success") do
        webhook = subject.create(params)
        expect(webhook).to be_a(entity_klass)
        expect(webhook.description).to eq(params[:description])
      end
    end
  end

end