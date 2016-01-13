require 'spec_helper'

describe Cobrato::Resources::RegressCnab do
  let(:http)          { Cobrato::Http.new('45d4e96c707f2a45f73ac9848ff8eeab') }
  let(:entity_klass)  { Cobrato::Entities::RegressCnab }
  let(:params) do 
    {
      'cnabs'=> 'data:application/octet-stream;base64,MDJSRVRPUk5PMDFDT0JSQU5DQSAgICAgICAzMTMwM' +
               'DAyMjY5OTAgICAgICAgIFRBWFdFQiBDT01QTElBTkNFIFNPRlRXQVJFIFMvQTM0MUJBTkNPIElUQVU' +
               'gUy5BLjAzMTIxNTAxNjAwQlBJMDAzNzcwMzEyMTUgICAgICAgICAgICAgICAgICAgICAgICAgICAgI' +
               'CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA' +
               'gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI' +
               'CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA' +
               'gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI' +
               'CAgICAgICAgICAgIDAwMDAwMQ0KMTAyMTEwMDg5MTMwMDAxNzAzMTMwMDAyMjY5OTAgICAgICAgICA' +
               'gICAgICAgICAgICAgICAgICAgICAgICA4MTI3NzUzMiAgICAgICAgICAgIDE1NzAwMDAwMDA4NSAgI' +
               'CAgICAgICAgICBJMDYwMzEyMTUxMDI0ICAgICAgODEyNzc1MzIgICAgICAgICAgICAyMjEyMTUwMDA' +
               'wMDAwMDkzODUwMzQxMDAyNDAgIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM' +
               'DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwOTM4NTAwMDAwMDA' +
               'wMDAwMDAwMDAwMDAwMDAwMDAwMCAgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwQVRMQVMgQ' +
               '09QQ08gQlJBU0lMIExUREEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA' +
               'gICAgIDAwMDAwMg0KOTIwMTM0MSAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM' +
               'DAgICAgICAgICAgMDAwMDAwMjUwMDAwMDEyMDQxMzkxNyAgMDMvMTJMICAgICAgICAgICAgICAgICA' +
               'gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM' +
               'DAwMDAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzNzcwMDAwMDAwMjA' +
               'wMDAwMDA3Njc5OTYyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI' +
               'CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA' +
               'gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwM' +
               'DAwNA0K',
      'cnabs_file_name'=> 'exemplo.REM',
      'charge_account_id'=> '124'
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
        expect(regress_cnab.charge_account_id).to eq(124)
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
        expect(regress_cnab.charge_account_id).to eq(124)
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
