# frozen_string_literal: true

# Subsonic API ping.view endpoint
get "/rest/ping.view" do
  content_type :xml

  subsonic_xml_response
end

# Subsonic API getLicense.view endpoint
get "/rest/getLicense.view" do
  content_type :xml

  subsonic_xml_response do |xml|
    xml.send("licence", valid: "true", email: "user@examlpe.com", key: "your_license_key")
  end
end
