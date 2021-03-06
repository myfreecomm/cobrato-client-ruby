require "spec_helper"

describe Cobrato::Http do
  let(:token) { "t0k3n" }
  let!(:request) do
    class_spy(Typhoeus::Request).
      as_stubbed_const(transfer_nested_constants: true)
  end

  let!(:response) do
    Typhoeus::Response.new(return_code: :ok, code: 200, body: "OK")
  end

  before :each do
    Typhoeus.stub(/cobrato/).and_return(response)
    allow(Typhoeus::Request).to receive(:new).
      and_return(double :request, run: true, response: response)
  end

  subject { described_class.new(token) }

  shared_examples "verbs" do |verb|
    it "sends a #{verb.to_s.upcase} request to cobrato API" do
      subject.send(verb, "/some_resource")
      expect(request).to have_received(:new).
        with("https://sandbox.cobrato.com/api/v1/some_resource",
             method: verb,
             userpwd: "#{token}:x",
             accept_encoding: "gzip",
             params_encoding: :rack,
             headers:  {
                "Accept"      => "application/json",
                "Content-Type"  => "application/json",
                "User-Agent"  => Cobrato.configuration.user_agent
              }
            )
    end

    it "raises RequestTimeout when timed out" do
      response = Typhoeus::Response.new(return_code: :operation_timedout)
      Typhoeus.stub(/cobrato/).and_return(response)
      allow(Typhoeus::Request).to receive(:new).
        and_return(double :request, run: true, response: response)

      expect { subject.send(verb, "/some_resource") }.to raise_error(Cobrato::RequestTimeout)
    end

    it "raises RequestError when an error occurred" do
      response = Typhoeus::Response.new(return_code: :ok, code: 500, body: "")
      Typhoeus.stub(/cobrato/).and_return(response)
      allow(Typhoeus::Request).to receive(:new).
        and_return(double :request, run: true, response: response)

      expect { subject.send(verb, '/some_resource') }.to raise_error(Cobrato::RequestError)
    end
  end

  [:get, :post, :put, :patch, :delete].each do |verb|
    describe "##{verb.to_s}" do
      it_behaves_like "verbs", verb
    end
  end
end
