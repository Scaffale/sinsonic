# frozen_string_literal: true

require "spec_helper"
require_relative "../shared/succedful_request"

describe "AlbumList" do
  describe "#getAlbumList" do
    subject { get "/rest/getAlbumList", params }
    let(:params) { { type: "random" } }
    let(:expected_response) do
      '<?xml version="1.0" encoding="UTF-8"?>
    <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
    <albumList/>
    </subsonic-response>'
    end

    it_behaves_like "a successful request"

    describe("params") do
      describe("year") do
        before(:each) do
          artist_1 = FactoryBot.create(:artist, name: "Tashina Bergnaum")
          artist_2 = FactoryBot.create(:artist, name: "Randa Treutel")
          artist_3 = FactoryBot.create(:artist, name: "Sharron Prohaska III")
          FactoryBot.create(:album, id: 1, title: "Midnight Memories", artist: artist_1, user_rating: "4.4", average_rating: "1.6")
          FactoryBot.create(:album, id: 2, title: "Breakfast in America", artist: artist_2, user_rating: "4.4", average_rating: "1.6")
          FactoryBot.create(:album, id: 3, title: "Metallica", artist: artist_3, user_rating: "4.8", average_rating: "2.8")
          FactoryBot.create(:album, id: 4, title: "Frozen", artist: artist_1, user_rating: "3.9", average_rating: "1.3")
          FactoryBot.create(:album, id: 5, title: "Born in the U.S.A.", artist: artist_2, user_rating: "2.5", average_rating: "1.7")
          FactoryBot.create(:album, id: 6, title: "Legend: The Best of Bob Marley &amp; The Wailers", artist: artist_3, user_rating: "1.6",
                                    average_rating: "1.2")
          FactoryBot.create(:album, id: 7, title: "Happy Nation", artist: artist_1, user_rating: "4.0", average_rating: "2.9")
          FactoryBot.create(:album, id: 8, title: "Rumours", artist: artist_1, user_rating: "4.5", average_rating: "2.3")
        end

        describe("fromYear") do
          let(:params) { { type: "by_year", from_year: "1992", to_year: "2005" } }

          let(:expected_response) do
            '<?xml version="1.0" encoding="UTF-8"?>
<subsonic-response xmlns="http://subsonic.org/restapi" version="1.16.1" status="ok">
  <albumList>
    <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
    <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
    <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
    <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
    <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
    <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
    <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
    <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
  </albumList>
</subsonic-response>'
          end

          it_behaves_like "a successful request"

          # it "filters albums by year" do
          #   p Album.all
          #   puts ActiveRecord::Base.connection.current_database
          #   expect(subject.body).to eq(expected_response)
          # end
        end
      end
    end
  end
end
