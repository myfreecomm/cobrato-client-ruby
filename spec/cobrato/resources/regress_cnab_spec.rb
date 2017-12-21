require 'spec_helper'

describe Cobrato::Resources::RegressCnab do
  let(:token)        { 'b9bbae729100ff02283a5b43a6d6a641' }
  let(:http)         { Cobrato::Http.new(token) }
  let(:entity_klass) { Cobrato::Entities::RegressCnab }

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
        regress_cnab = subject.show(117)
        expect(regress_cnab).to be_a(entity_klass)
        expect(regress_cnab.charge_config_id).to eq(124)
      end
    end
  end

  describe '#destroy' do
    it 'returns true' do
      VCR.use_cassette('regress_cnabs/destroy/success') do
        result = subject.destroy(117)
        expect(result).to be_truthy
      end
    end
  end

  describe '#create' do
    let(:token) { '105cc56eaed0acb0ff1e94e28e8619f2' }

    context 'when charge' do
      let(:params) do
        {
          'charge_config_id' => '226',
          'cnabs' => {
            'content'      => "MDJSRVRPUk5PMDFDT0JSQU5DQSAgICAgICAwMDAwMDAwMDAwMDAwNDg3NTA4\nMEZSRUUgQ09NTVVOSVRFUyBDT05TVUxUT1JJQSBFTTIzN0JSQURFU0NPICAg\nICAgIDIxMDExNjAxNjAwMDAwMDAwMDEgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgIDIxMDExNiAgICAgICAgIDAwMDAwMQ0KMTAy\nMDU3OTM4MzIwMDAxMjYwMDAwMDA5MDM0MjgwMDE3MjI1MSAgICAgICAgICAg\nICAgICAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwMDAyMzAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDA5MDYyMTAxMTZBNzVBICAgICAgMDAwMDAwMDAwMDAw\nMDAyMTEyMzMyNTAxMTYwMDAwMDAwMDA1MDAwMjM3MDQxNTIgIDAwMDAwMDAw\nMDAyNTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDUwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAg\nMDAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAwMDAwMg0KOTIwMTIz\nNyAgICAgICAgICAwMDAwMDAwMzAwMDAwMDAwMDIwOTEzMDAwMDAwMDEgICAg\nICAgICAgMDAwMDMwMDAwMDAwMjA5MTMwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMCAgICAgICAgIDAwMDAwNQ0K\n",
            'content_type' => 'text/plain',
            'filename'     => 'exemplo.RET'
          }
        }
      end

      it 'creates a regress_cnab' do
        VCR.use_cassette('regress_cnabs/create/charge-success') do
          regress_cnab = nil

          expect {
            regress_cnab = subject.create(params)
          }.to output("Warning: The 'charge_config_id' param is deprecated. See Cobrato API docs for more info.\n").to_stdout

          expect(regress_cnab).to be_a(entity_klass)
          expect(regress_cnab.charge_config_id).to eq(226) # deprecated
          expect(regress_cnab.config_id).to eq(226)
        end
      end
    end

    context 'when payment' do
      let(:params) do
        {
          'config_id' => '3',
          'type' => 'payment',
          'cnabs' => {
            'content'      => "MzQxMDAwMDAgICAgICAwODEyMTU3ODMzNTEwMDAxOTMgICAgICAgICAgMDAw\nMTQ3NTY5IDA2MDE1IDAwMDAwMDAwODUzMyAyTElWRSBDQVBJVEFMIENPTlNV\nTFRPUklBIEUgSU5GQkFOQ08gSVRBVSBTL0EgICAgICAgICAgICAgICAgICAg\nICAgICAgIDIxOTEwMjAxNzExNTM0ODAwMDU5NjA4MTA2MjUwDQozNDEwMDAx\nMUMyMjE2MDgxIDIxNTc4MzM1MTAwMDE5MyAgICAgICAgICAgICAgICAgICAg\nMDYwMTUgMDAwMDAwMDA4NTMzIDJMSVZFIENBUElUQUwgQ09OU1VMVE9SSUEg\nRSBJTkYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nUlVBIERPIENBUk1PICAgICAgICAgICAgICAgICAgNDMgICAgICAgICAgICAg\nICAgICBSSU8gREUgSkFORUlSTyAgICAgIDIwMDExMDIwUkoNCjM0MTAwMDEz\nMDAwMDFOMDAwMDIyMTcyMjE1NzgzMzUxMDAwMTkzMzAwOTIwMTcwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDAwMDA4NzQzMDAwMDAwMDAwMDAwMDAwMDAwMDAw\nMDAwMDAwMDAwMDAwMDAwMDA4NzQzMjUxMDIwMTcyNTEwMjAxNyAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgIExJVkUgQ0FQSVRBTCBDT05TVUxUT1JJ\nQSBFIElORjMgICAgICAgICAgICAgICAgICAgNDMzMzQyNjcyMDAwMDE4QkQN\nCjM0MTAwMDE1ICAgICAgICAgMDAwMDAzMDAwMDAwMDAwMDg3NDMgICAgICAg\nICAgICAgIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDg3NDMNCjM0MTAwMDIx\nQzIyOTEwODEgMjE1NzgzMzUxMDAwMTkzICAgICAgICAgICAgICAgICAgICAw\nNjAxNSAwMDAwMDAwMDg1MzMgMkxJVkUgQ0FQSVRBTCBDT05TVUxUT1JJQSBF\nIElORiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBS\nVUEgRE8gQ0FSTU8gICAgICAgICAgICAgICAgICA0MyAgICAgICAgICAgICAg\nICAgIFJJTyBERSBKQU5FSVJPICAgICAgMjAwMTEwMjBSSg0KMzQxMDAwMjMw\nMDAwMU8wMDA4NTYyMDAwMDAwMDMxODk0MDA2NDcyOTQ4MTE1NzgzMzUxMDEw\nMDE4MTA5NzI3MzUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyNTEw\nMjAxN1JFQTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTg5NDI1MTAyMDE3\nMDAwMDAwMDAwMDAxODk0ICAgMDAwMDAwMDAwICAgMTQgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgIDA0MzMzNDI2NzMwMDAwMTdCRA0K\nMzQxMDAwMjUgICAgICAgICAwMDAwMDMwMDAwMDAwMDAwMDAwMDE4OTQwMDAw\nMDAwMDAwMDAwMDAwMDANCjM0MTk5OTk5ICAgICAgICAgMDAwMDAyMDAwMDA4\nMDAwMDAwDQo=\n",
            'content_type' => 'text/plain',
            'filename'     => 'pagamento.RET'
          }
        }
      end

      it 'creates a regress_cnab' do
        VCR.use_cassette('regress_cnabs/create/payment-success') do
          regress_cnab = subject.create(params)

          expect(regress_cnab).to be_a(entity_klass)
          expect(regress_cnab.config_id).to eq(3)
          expect(regress_cnab.charge_config_id).to eq(nil) # deprecated
        end
      end
    end
  end

  describe '#file' do
    it 'returns a simple struct with the RegressCnab file url' do
      VCR.use_cassette('regress_cnabs/file/success') do
        file = subject.file(117)
        expect(file).to be_a(OpenStruct)
        expect(file.url).to match('https://.*s3.amazonaws.com')
      end
    end
  end
end
