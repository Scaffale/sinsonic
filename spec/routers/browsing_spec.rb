# frozen_string_literal: true

require "spec_helper"
require_relative "../shared/succedful_request"

describe "Browsing" do
  describe "#getMusicFolders" do
    subject { get "/rest/getMusicFolders" }
    let(:expected_response) do
      '<subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
    <musicFolders>
    <musicFolder id="1" name="media"/>
    </musicFolders>
    </subsonic-response>'
    end

    it_behaves_like "a successful request"
  end
end
