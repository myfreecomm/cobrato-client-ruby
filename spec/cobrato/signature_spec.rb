require "spec_helper"

describe Cobrato::Signature do
  let(:body) do
    {
      test: true
    }
  end

  let(:secret)             { 'my-cobrato-secret' }
  let(:cobrato_request_id) { 'anything' }
  let(:cobrato_signature)  { OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret, "#{cobrato_request_id}#{body}") }

  describe '#check?' do
    subject { described_class.new(secret) }

    context 'when headers are ok' do
      it 'returns true' do
        expect(subject.check?(cobrato_request_id, cobrato_signature, body)).to be_truthy
      end
    end

    context 'when headers are not ok' do
      let(:cobrato_signature) { OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret, "anotherThing#{body}") }

      it 'returns false' do
        expect(subject.check?(cobrato_request_id, cobrato_signature, body)).to be_falsy
      end
    end
  end
end
