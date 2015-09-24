require "spec_helper"

describe Cobrato::Resources::ChargingType do
  let(:http) { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of bank accounts" do
      VCR.use_cassette("charging_types/list/success") do
        charging_types = subject.list
        expect(charging_types).to be_a(Struct)

        expect(charging_types.bank_billets).to be_a(Array)
        charging_types.bank_billets.each do |e|
          expect(e).to be_a(Cobrato::Entities::BankBillet)
        end
      end
    end
  end
end
