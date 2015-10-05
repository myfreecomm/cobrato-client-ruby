require "spec_helper"

describe Cobrato::Entities::Base do

  class DummyEntity < Cobrato::Entities::Base
    attribute :property_1, String
    attribute :property_2, String
  end

  let(:links) do
      [
        { "rel" => "self", "method" => "GET", "href" => "http://test.local/api/v1/dummies/1" },
        { "rel" => "update", "method" => "PUT", "href" => "http://test.local/api/v1/dummies/1" },
        { "rel" => "destroy", "method" => "DELETE", "href" => "http://test.local/api/v1/dummies/1"}
      ]
  end
  let(:hash) { { property_1: "1", property_2: "2", _links: links } }

  subject { DummyEntity.new(hash) }

  it "builds an object from a hash" do
    expect(subject).to respond_to(:property_1)
    expect(subject).to respond_to(:property_2)
    expect(subject.property_1).to eq("1")
    expect(subject.property_2).to eq("2")
  end

  describe "#attributes" do
    it "returns a hash from object attributes" do
      expect(subject.to_hash).to eq(hash)
    end
  end

  describe "#url" do
    context "self" do
      it { expect(subject.url("self")).to eq("http://test.local/api/v1/dummies/1") }
    end

    context "update" do
      it { expect(subject.url("update")).to eq("http://test.local/api/v1/dummies/1") }
    end

    context "destroy" do
      it { expect(subject.url("destroy")).to eq("http://test.local/api/v1/dummies/1") }
    end

    context "non existent" do
      it { expect(subject.url("trash")).to eq("") }
    end
  end
end
