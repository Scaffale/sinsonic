# frozen_string_literal: true

require "fileutils"
require_relative "../helpers/media_scanner"

# Subsonic API startScan.view endpoint
post "/rest/startScan.view" do
  content_type :xml

  init_scan
  # For now, let's just return a placeholder response.
  subsonic_xml_response do |xml|
    xml.send("scanStatus", scanning: "true", count: 5422)
    # xml.send("scanStatus", scanning: "true", count: media_files.count.to_s)
  end
end
