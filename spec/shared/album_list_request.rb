# frozen_string_literal: true

require "nokogiri"

RSpec.shared_examples "a album list request" do
  let(:subject_body) do
    subject
    last_response.body
  end

  it "should have correct album list" do
    response_xml = Nokogiri::XML(subject_body)
    expected_response_xml = Nokogiri::XML(expected_response)

    album_tag_response = response_xml.xpath("//albums")
    expected_album_tag_response = expected_response_xml.xpath("//albums")

    expect(album_tag_response).to eq(expected_album_tag_response)
  end
end
