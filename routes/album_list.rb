# frozen_string_literal: true

require 'lucky_case'

# Subsonic API getAlbumList endpoint
get "/rest/getAlbumList" do
  content_type :xml

  if params[:type].blank?
    return subsonic_xml_response do |xml|
      xml.error(code: 10, message: "type is required")
    end
  end

  return album_list_by_year if params[:type] == "byYear"
  return album_list_by_genre if params[:type] == "byGenre"

  albums = Album.send(LuckyCase.snake_case(params[:type])).offset(params[:offset] || 0).limit(params[:size] || 10)

  build_albumb_response albums
end

def album_list_by_year
  if [params[:from_year], params[:to_year]].any?(&:blank?)
    return subsonic_xml_response do |xml|
      xml.error(code: 10, message: "when type is by_year, both from_year and to_year are required")
    end
  end

  build_albumb_response Album.by_year(from_year: params[:from_year], to_year: params[:to_year])
end

def album_list_by_genre
  if params[:genre].blank?
    return subsonic_xml_response do |xml|
      xml.error(code: 10, message: "when type is by_genre, genre is required")
    end
  end

  build_albumb_response Album.by_genre(genre: params[:genre])
end

def build_albumb_response(albums)
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
