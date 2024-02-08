# frozen_string_literal: true

require_relative "../spec_helper"

require_relative "../shared/succedful_request"

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
