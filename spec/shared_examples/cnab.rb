shared_examples "cnab" do |attrs|
  let(:attributes) do
    {
      'id' => 1,
      'type' => 'charge',
      'config_id' => 1,
      'charge_config_id' => 1,
      'status' => 'processed'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', [:id, :type, :config_id, :charge_config_id, :status]

  describe '#charge_config_id' do
    it 'print a deprecation warning' do
      expect {
        subject.charge_config_id
      }.to output("Warning: 'charge_config_id' is deprecated. Use 'config_id' instead.\n").to_stdout
    end
  end
end
