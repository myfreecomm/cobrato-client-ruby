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

end
