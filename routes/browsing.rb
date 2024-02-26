# frozen_string_literal: true

# Subsonic API getMusicFolders endpoint
get "/rest/getMusicFolders" do
  content_type :xml

  subsonic_xml_response do |xml|
    xml.musicFolders do
      xml.musicFolder(id: 1, name: "media")
    end
  end
end
