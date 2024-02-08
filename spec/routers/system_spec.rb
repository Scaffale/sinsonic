# frozen_string_literal: true

require_relative "../spec_helper"

require_relative "../shared/succedful_request"

describe("ping.view") do
  subject { get "/rest/ping.view" }
  let(:expected_response) { '<?xml version="1.0" encoding="UTF-8"?><subsonic-response xmlns="http://subsonic.org/restapi" version="1.16.1" status="ok"/>' }

  it_behaves_like "a successful request"
end
