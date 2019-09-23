# frozen_string_literal: true
require "spec_helper"

describe Cobrato::Resources::Company do
  let(:http)          { Cobrato::Http.new("3fa5e9ecc23e477fd7ba3a41063a9fab") }
  let(:entity_klass)  { Cobrato::Entities::Company }
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
    it "returns an array of companies" do
      VCR.use_cassette("companies/list/success") do
        companies = subject.list
        expect(companies).to be_a(Array)
        companies.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns a Company instance showd" do
      VCR.use_cassette("companies/show/success") do
        company = subject.show(227)
        expect(company).to be_a(entity_klass)
        expect(company.name).to eq("João Silveira")
      end
    end
  end

  describe "#update" do
    it "returns a Company instance updated" do
      VCR.use_cassette("companies/update/success") do
        company = subject.update(227, { name: "RSpec integration" })
        expect(company).to be_a(entity_klass)
        expect(company.name).to eq("RSpec integration")
      end
    end
  end

  describe "#destroy" do
    it "returns true" do
      VCR.use_cassette("companies/destroy/success") do
        result = subject.destroy(227)
        expect(result).to be_truthy
      end
    end
  end

  describe "#create" do
    it "creates a company" do
      VCR.use_cassette("companies/create/success") do
        company = subject.create(params)
        expect(company).to be_a(entity_klass)
        expect(company.name).to eq(params['name'])
      end
    end
  end
end
