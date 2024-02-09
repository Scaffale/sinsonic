# frozen_string_literal: true

require_relative "../helpers/media_scanner"

scanning = false
# Subsonic API startScan endpoint
post "/rest/startScan" do
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

# Subsonic API getScanStatus endpoint
get "/rest/getScanStatus" do
  content_type :xml

  subsonic_xml_response do |xml|
    xml.send("scanStatus", scanning:, count: Song.all.count)
  end
end
