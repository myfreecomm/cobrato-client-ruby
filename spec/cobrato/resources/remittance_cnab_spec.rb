require 'spec_helper'

describe Cobrato::Resources::RemittanceCnab do
  let(:token)         { '6d60aa0fe1706fb3695ef0ad67f1da01' }
  let(:http)          { Cobrato::Http.new(token) }
  let(:entity_klass)  { Cobrato::Entities::RemittanceCnab }

  subject { described_class.new(http) }

  it 'has a instance of Cobrato::Http' do
    expect(subject.http).to eq http
  end

  describe '#list' do
    it 'returns an array of remittance_cnabs' do
      VCR.use_cassette('remittance_cnabs/list/success') do
        remittance_cnabs = subject.list
        expect(remittance_cnabs).to be_a(Array)
        remittance_cnabs.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe '#show' do
    it 'returns an RemittanceCnab instance showd' do
      VCR.use_cassette('remittance_cnabs/show/success') do
        remittance_cnab = subject.show(41)
        expect(remittance_cnab).to be_a(entity_klass)
        expect(remittance_cnab.charge_config_id).to eq(126)
      end
    end
  end

  describe '#destroy' do
    it 'returns true' do
      VCR.use_cassette('remittance_cnabs/destroy/success') do
        result = subject.destroy(41)
        expect(result).to be_truthy
      end
    end
  end

  describe '#create' do
    let(:params) do
      {
        'charge_config_id' => '126',
        'charge_ids'        => [1914, 1915]
      }
    end

    it 'creates one or more remittance_cnabs' do
      VCR.use_cassette('remittance_cnabs/create/success') do
        remittance_cnabs = nil

        expect {
          remittance_cnabs = subject.create(params)
        }.to output("Warning: The 'charge_ids' param is deprecated. See Cobrato API docs for more info.\n").to_stdout

        expect(remittance_cnabs).to be_a(Array)
        remittance_cnabs.each do |e|
          expect(e).to be_a(entity_klass)
        end
        expect(remittance_cnabs.first.charge_config_id).to eq(126)
      end
    end
  end

  describe '#file' do
    it 'returns a simple struct with the RemittanceCnab file url' do
      VCR.use_cassette('remittance_cnabs/file/success') do
        file = subject.file(41)
        expect(file).to be_a(OpenStruct)
        expect(file.url).to match('https://.*s3.amazonaws.com')
      end
    end
  end

  describe '#charges' do
    it 'returns an array of Charge' do
      VCR.use_cassette('remittance_cnabs/charges/success') do
        charges = nil

        expect {
          charges = subject.charges(41)
        }.to output("Warning: The 'charges' endpoint is deprecated. Use 'items' endpoint instead.\n").to_stdout

        expect(charges).to be_a(Array)
        charges.each do |e|
          expect(e).to be_a(Cobrato::Entities::Charge)
        end
      end
    end
  end

  describe '#items' do
    let(:token) { '3fa5e9ecc23e477fd7ba3a41063a9fab' }

    context 'charge remittance cnab' do
      it 'returns an array of Charge' do
        VCR.use_cassette('remittance_cnabs/items/success-charges') do
          items = subject.items(488)
          expect(items).to be_a(Array)
          items.each do |e|
            expect(e).to be_a(Cobrato::Entities::Charge)
          end
        end
      end
    end

    context 'payment remittance cnab' do
      it 'returns an array of Payment' do
        VCR.use_cassette('remittance_cnabs/items/success-payments') do
          items = subject.items(492)
          expect(items).to be_a(Array)
          items.each do |e|
            expect(e).to be_a(Cobrato::Entities::Payment)
          end
        end
      end
    end
  end
end
