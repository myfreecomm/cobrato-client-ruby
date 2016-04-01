require 'spec_helper'

describe Cobrato::Resources::RegressCnab do
  let(:http)          { Cobrato::Http.new('b9bbae729100ff02283a5b43a6d6a641') }
  let(:entity_klass)  { Cobrato::Entities::RegressCnab }
  let(:params) do
    {
      'charge_config_id' => '124',
      'cnabs' => {
        'content'      => "MDJSRVRPUk5PMDFDT0JSQU5DQSAgICAgICAwMDAwMDAwMDAwMDAwNDg3NTA4\nMEZSRUUgQ09NTVVOSVRFUyBDT05TVUxUT1JJQSBFTTIzN0JSQURFU0NPICAg\nICAgIDIxMDExNjAxNjAwMDAwMDAwMDEgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgIDIxMDExNiAgICAgICAgIDAwMDAwMQ0KMTAy\nMDU3OTM4MzIwMDAxMjYwMDAwMDA5MDM0MjgwMDE3MjI1MSAgICAgICAgICAg\nICAgICAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwMDAyMzAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDA5MDYyMTAxMTZBNzVBICAgICAgMDAwMDAwMDAwMDAw\nMDAyMTEyMzMyNTAxMTYwMDAwMDAwMDA1MDAwMjM3MDQxNTIgIDAwMDAwMDAw\nMDAyNTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDUwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAg\nMDAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAwMg0KOTIwMTIz\nNyAgICAgICAgICAwMDAwMDAwMzAwMDAwMDAwMDIwOTEzMDAwMDAwMDEgICAg\nICAgICAgMDAwMDMwMDAwMDAwMjA5MTMwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMCAgICAgICAgIDAwMDAwNQ0K\n",
        'content_type' => 'text/plain',
        'filename'     => 'exemplo.RET'
      }
    }
  end

  subject { described_class.new(http) }

  it 'has a instance of Cobrato::Http' do
    expect(subject.http).to eq http
  end

  describe '#list' do
    it 'returns an array of regress_cnabs' do
      VCR.use_cassette('regress_cnabs/list/success') do
        regress_cnabs = subject.list
        expect(regress_cnabs).to be_a(Array)
        regress_cnabs.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe '#show' do
    it 'returns an RegressCnab instance showd' do
      VCR.use_cassette('regress_cnabs/show/success') do
        regress_cnab = subject.show(45)
        expect(regress_cnab).to be_a(entity_klass)
        expect(regress_cnab.charge_config_id).to eq(124)
      end
    end
  end

  describe '#destroy' do
    it 'returns true' do
      VCR.use_cassette('regress_cnabs/destroy/success') do
        result = subject.destroy(45)
        expect(result).to be_truthy
      end
    end
  end

  describe '#create' do
    it 'creates a regress_cnab' do
      VCR.use_cassette('regress_cnabs/create/success') do
        regress_cnab = subject.create(params)
        expect(regress_cnab).to be_a(entity_klass)
        expect(regress_cnab.charge_config_id).to eq(124)
      end
    end
  end

  describe '#file' do
    it 'returns a simple struct with the RegressCnab file url' do
      VCR.use_cassette('regress_cnabs/file/success') do
        file = subject.file(45)
        expect(file).to be_a(OpenStruct)
        expect(file.url).to match('https://.*s3.amazonaws.com')
      end
    end
  end
end
