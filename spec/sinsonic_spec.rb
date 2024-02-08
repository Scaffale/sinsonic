# frozen_string_literal: true

# spec/sinsonic_spec.rb

require_relative "spec_helper"

RSpec.shared_examples "a successful request" do
  it { is_expected.to be_ok }

  it "should have correct body" do
    expect(subject_body).to be_equivalent_to(expected_response)
  end
end

describe "Sinsonic API" do
  let(:subject_body) do
    subject
    last_response.body
  end
  describe("ping.view") do
    subject { get "/rest/ping.view" }
    let(:expected_response) { '<?xml version="1.0" encoding="UTF-8"?><subsonic-response xmlns="http://subsonic.org/restapi" version="1.16.1" status="ok"/>' }

    it_behaves_like "a successful request"
  end

  # descrive("getLicense.view") do
  #   # let(:expected_response) { }
  #   subject { get "/rest/getLicense.view" }

  #   it { is_expected.to be_ok }
  # end

  describe("startScan.view") do
    subject { post "/rest/startScan.view" }
    let(:expected_response) do
      '<?xml version="1.0" encoding="UTF-8"?>
    <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <scanStatus scanning="true" count="5422"/>
    </subsonic-response>'
    end

    it_behaves_like "a successful request"
  end
end
