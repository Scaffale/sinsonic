# frozen_string_literal: true

require "fileutils"
require_relative "../helpers/media_scanner"

scanning = false
# Subsonic API startScan.view endpoint
post "/rest/startScan.view" do
  content_type :xml

  fork do
    scanning = true
    init_scan
    scanning = false
  end

  subsonic_xml_response do |xml|
    xml.send("scanStatus", scanning:, count: Song.all.count)
  end
end

# Subsonic API getScanStatus.view endpoint
get "/rest/getScanStatus.view" do
  content_type :xml

  subsonic_xml_response do |xml|
    xml.send("scanStatus", scanning:, count: Song.all.count)
  end
end
