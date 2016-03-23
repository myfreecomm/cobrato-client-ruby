require 'spec_helper'

describe Cobrato do

  it 'has a version number' do
    expect(Cobrato::VERSION).not_to be nil
  end

  describe ".configuration" do
    it "is done via block initialization" do
      Cobrato.configure do |c|
        c.url = "http://some/where"
        c.user_agent = "My App v1.0"
      end
      expect(Cobrato.configuration.url).to eq "http://some/where"
      expect(Cobrato.configuration.user_agent).to eq "My App v1.0"
    end

    it "uses a singleton object for the configuration values" do
      config1 = Cobrato.configuration
      config2 = Cobrato.configuration
      expect(config1).to eq config2
    end
  end

  describe ".configure" do
    it "returns nil when no block given" do
      expect(Cobrato.configure).to eql(nil)
    end

    it "raise error if no method" do
      expect do
        Cobrato.configure { |c| c.user = "Bart" }
      end.to raise_error(NoMethodError)
    end
  end

  describe ".client" do
    subject { described_class.client("MYTOKEN") }

    it "returns an instance of Cobrato::Client" do
      expect(subject).to be_a(Cobrato::Client)
    end
  end

  describe ".subscribe" do
    class FakePublisher
      include Wisper::Publisher

      def apply
        publish("fake.event")
      end
    end

    it "notifies all listeners about an event occurrence" do
      listener = double("listener")
      expect(listener).to receive(:call).and_return(true)
      described_class.subscribe("fake.event", listener)
      FakePublisher.new.apply
    end
  end

  describe '.signature' do
    subject { described_class.signature("my-secret-key") }

    it "returns an instance of Cobrato::Client" do
      expect(subject).to be_a(Cobrato::Signature)
    end
  end
end
