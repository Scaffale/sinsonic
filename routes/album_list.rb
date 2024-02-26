# frozen_string_literal: true

# Subsonic API getAlbumList endpoint
get "/rest/getAlbumList" do
  content_type :xml

  if params[:type].blank?
    return subsonic_xml_response do |xml|
      xml.error(code: 10, message: "type is required")
    end
  end

  # cambiare mettendo lo scope in model
  albums = Album.all # .send(params[:type]).offset(params[:offset] || 0).limit(params[:size] || 10)

  subsonic_xml_response do |xml|
    xml.albumList do
      albums.each do |album|
        xml.album(album.to_xml_list)
      end
    end
  end
end

# random,
# newest,
# highest,
# frequent,
# recent.
# alphabeticalByName
# alphabeticalByArtist
# starred
# byYear
# byGenre
