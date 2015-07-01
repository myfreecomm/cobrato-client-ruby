require "spec_helper"

describe Cobrato::Resources::Payee do
  let(:http)          { Cobrato::Http.new("45d4e96c707f2a45f73ac9848ff8eeab") }
  let(:entity_klass)  { Cobrato::Entities::Payee }
  let(:params) do
    {
      "national_identifier_type" => "cpf",
      "national_identifier" => "38031171513",
      "name" => "João Silveira",
      "zipcode" => "99000-750",
      "city" => "Carapebus",
      "state" => "RJ",
      "neighbourhood" => "Centro",
      "street" => "Rua Julio de Castilhos",
      "number" => "100",
      "complement" => "Ao lado da lotérica."
    }
  end

  subject { described_class.new(http) }

  it "has a instance of Cobrato::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of payees" do
      VCR.use_cassette("payees/list/success") do
        payees = subject.list
        expect(payees).to be_a(Array)
        payees.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns a Payee instance showd" do
      VCR.use_cassette("payees/show/success") do
        payee = subject.show(16)
        expect(payee).to be_a(entity_klass)
        expect(payee.name).to eq("João Silveira")
      end
    end
  end

  describe "#update" do
    it "returns a Payee instance updated" do
      VCR.use_cassette("payees/update/success") do
        payee = subject.update(16, {name: "RSpec integration"})
        expect(payee).to be_a(entity_klass)
        expect(payee.name).to eq("RSpec integration")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("payees/destroy/success") do
        result = subject.destroy(16)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a payee" do
      VCR.use_cassette("payees/create/success") do
        payee = subject.create(params)
        expect(payee).to be_a(entity_klass)
        expect(payee.name).to eq(params[:name])
      end
    end
  end
end
