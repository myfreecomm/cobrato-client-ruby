require "spec_helper"

describe Cobrato::Entities::Company do
  let(:attributes) do
    {
      national_identifier_type: "cpf",
      national_identifier: "38031171513",
      name: "João Silveira",
      zipcode: "99000-750",
      city: "Carapebus",
      state: "RJ",
      neighbourhood: "Centro",
      street: "Rua Julio de Castilhos",
      number: "100",
      complement: "Ao lado da lotérica.",
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :national_identifier_type, :national_identifier, :name, :zipcode, :city, :state, :neighbourhood, :number, :complement, :street]
end
