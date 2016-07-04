require "spec_helper"

describe Cobrato::Entities::CreditCard do
  let(:attributes) do
    {
      id: 7,
      number: "6167",
      holder_name: "John Doe",
      brand: "mastercard",
      expiration: "05/18",
      avs_address: "",
      avs_number: "",
      avs_complement: "",
      avs_district: "",
      avs_zipcode: "",
      reusability_status: "ok",
      reusability_error_message: "",
      payer_id: 1,
      charge_config_id: 1
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :number, :holder_name, :reusability_status, :reusability_error_message, :brand, :expiration,
    :avs_address, :avs_number, :avs_complement, :avs_district, :avs_zipcode, :payer_id, :charge_config_id]
end
