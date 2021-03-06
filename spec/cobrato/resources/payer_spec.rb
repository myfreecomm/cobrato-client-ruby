require "spec_helper"

describe Cobrato::Resources::Payer do
  let(:http)          { Cobrato::Http.new("3fa5e9ecc23e477fd7ba3a41063a9fab") }
  let(:entity_klass)  { Cobrato::Entities::Payer }
  let(:params) do
    {
      "national_identifier_type" => "cpf",
      "national_identifier" => "77120350242",
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
    it "returns an array of people" do
      VCR.use_cassette("payers/list/success") do
        people = subject.list
        expect(people).to be_a(Array)
        people.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns a Person instance showed" do
      VCR.use_cassette("payers/show/success") do
        person = subject.show(4016)
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq("João Silveira")
      end
    end
  end

  describe "#update" do
    it "returns a Person instance updated" do
      VCR.use_cassette("payers/update/success") do
        person = subject.update(4016, {name: "John Doe"})
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq("John Doe")
      end
    end
  end

  describe "#create" do
    it "creates a person" do
      VCR.use_cassette("payers/create/success") do
        person = subject.create(params)
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq(params["name"])
        expect(person.id).to eq(4016)
      end
    end
  end
end
