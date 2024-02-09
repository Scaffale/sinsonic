# frozen_string_literal: true

require_relative "../spec_helper"
require_relative "../shared/succedful_request"

describe("media_libery_scanning API") do
  let(:expected_response) do
    '<?xml version="1.0" encoding="UTF-8"?>
  <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
      <scanStatus scanning="false" count="0"/>
  </subsonic-response>'
  end

  describe("startScan") do
    subject { post "/rest/startScan" }

    before(:each) do
      allow_any_instance_of(Sinatra::Application).to receive(:init_scan).and_return(nil)
    end

    it_behaves_like "a successful request"
  end

  describe("getScanStatus") do
    subject { get "/rest/getScanStatus" }

    it_behaves_like "a successful request"
  end
end
