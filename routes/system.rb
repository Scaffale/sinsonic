# frozen_string_literal: true

# Subsonic API ping endpoint
get "/rest/ping" do
  content_type :xml

  subsonic_xml_response
end

# Subsonic API getLicense endpoint
get "/rest/getLicense" do
  content_type :xml

  subsonic_xml_response do |xml|
    xml.send("licence", valid: "true", email: "user@examlpe.com", key: "your_license_key")
  end
end
