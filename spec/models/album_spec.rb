# frozen_string_literal: true

require "spec_helper"

describe("Album model") do
  describe("#to_xml_list") do
    it("returns an album as a hash") do
      album = Album.new(title: "The Wall", artist: Artist.new(name: "Pink Floyd"))
      expect(album.to_xml_list).to eq({
                                        id: nil,
                                        title: "The Wall",
                                        artist: "Pink Floyd",
                                        isDir: true,
                                        coverArt: 22,
                                        userRating: nil,
                                        averageRating: nil
                                      })
    end
  end
end
