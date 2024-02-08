# frozen_string_literal: true

# Subsonic API startScan.view endpoint
post "/rest/startScan.view" do
  content_type :xml

  # Here you would initiate a scan of your media folders.
  # This could involve iterating over the files in your media folders,
  # checking for new or updated files, and updating your database as needed.
  # The specifics would depend on how your application is structured and how
  # you're storing your media files.

  # For now, let's just return a placeholder response.
  subsonic_xml_response do |xml|
    xml.send("scanStatus", scanning: "true", count: "5422")
  end
end
