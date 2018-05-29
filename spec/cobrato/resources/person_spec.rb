require "spec_helper"

describe Cobrato::Resources::Person do
  let(:http)          { Cobrato::Http.new("3fa5e9ecc23e477fd7ba3a41063a9fab") }
  let(:entity_klass)  { Cobrato::Entities::Person }
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
    it "returns an array of people" do
      VCR.use_cassette("people/list/success") do
        people = subject.list
        expect(people).to be_a(Array)
        people.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns a Payer instance showd" do
      VCR.use_cassette("people/show/success") do
        person = subject.show(4015)
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq("João Silveira")
      end
    end
  end

  describe "#update" do
    it "returns a Payer instance updated" do
      VCR.use_cassette("people/update/success") do
        person = subject.update(4015, {name: "João Silveira"})
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq("João Silveira")
      end
    end
  end

  describe "#create" do
    it "creates a person" do
      VCR.use_cassette("people/create/success") do
        person = subject.create(params)
        expect(person).to be_a(entity_klass)
        expect(person.name).to eq(params['name'])
        expect(person.id).to eq(4015)
      end
    end
  end
end
