require "spec_helper"

describe Cobrato::Configuration do

  it "uses the production Cobrato URL by default" do
    expect(subject.url).to eq "https://app.cobrato.com.br/api/v1"
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq "Cobrato Ruby Client v#{Cobrato::VERSION}"
  end

end
