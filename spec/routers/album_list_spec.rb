# frozen_string_literal: true

require "spec_helper"
require_relative "../shared/succedful_request"

describe "AlbumList" do
  describe "#getAlbumList" do
    before(:all) do
      artist_one = FactoryBot.create(:artist, name: "Tashina Bergnaum")
      artist_two = FactoryBot.create(:artist, name: "Randa Treutel")
      artist_three = FactoryBot.create(:artist, name: "Sharron Prohaska III")
      FactoryBot.create(:album, id: 1, title: "Midnight Memories", artist: artist_one, user_rating: "4.4", average_rating: "1.6", year: 1991, play_count: 0)
      FactoryBot.create(:album, id: 2, title: "Breakfast in America", artist: artist_two, user_rating: "4.4", average_rating: "1.6", year: 1992, play_count: 2)
      FactoryBot.create(:album, id: 3, title: "Metallica", artist: artist_three, user_rating: "4.8", average_rating: "2.8", year: 1995, play_count: 1)
      FactoryBot.create(:album, id: 4, title: "Frozen", artist: artist_one, user_rating: "3.9", average_rating: "1.3", year: 1996, play_count: 5)
      FactoryBot.create(:album, id: 5, title: "Born in the U.S.A.", artist: artist_two, user_rating: "2.5", average_rating: "1.7", year: 1999, play_count: 9)
      FactoryBot.create(:album, id: 6, title: "Legend: The Best of Bob Marley &amp; The Wailers", artist: artist_three, user_rating: "1.6",
                                average_rating: "1.2", year: 2000, play_count: 0)
      FactoryBot.create(:album, id: 7, title: "Happy Nation", artist: artist_one, user_rating: "4.0", average_rating: "2.9", year: 2005, play_count: 10)
      FactoryBot.create(:album, id: 8, title: "Rumours", artist: artist_one, user_rating: "4.5", average_rating: "2.3", year: 2020, play_count: 6)
    end

    subject { get "/rest/getAlbumList", params }
    let(:type) { "" }
    let(:params) { { type: } }

    describe("params") do
      describe("missing") do
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <error code="10" message="type is required" />
        </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("random") do
        let(:type) { "random" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
          <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
          <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
          <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
          <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
          <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
          <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
          <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        </albumList>
        </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("byYear") do
        let(:type) { "byYear" }

        let(:params) { { type:, from_year: "1992", to_year: "2005" } }

        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
<subsonic-response xmlns="http://subsonic.org/restapi" version="1.16.1" status="ok">
  <albumList>
    <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
    <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
    <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
    <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
    <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
    <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
  </albumList>
</subsonic-response>'
        end

        it_behaves_like "a successful request"

        describe("missim parameters") do
          let(:params) { { type:, to_year: "2005" } }
          let(:expected_response) do
            '<?xml version="1.0" encoding="UTF-8"?>
<subsonic-response xmlns="http://subsonic.org/restapi" version="1.16.1" status="ok">
  <error code="10" message="when type is by_year, both from_year and to_year are required" />
</subsonic-response>'
          end
          it_behaves_like "a successful request"
        end
      end

      describe("byGenre") do
        let(:type) { "byGenre" }
        p "TBI! by genere"
      end

      describe("newest") do
        let(:type) { "newest" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
          <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
          <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
          <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
          <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
          <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
          <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
          </albumList>
          </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("highest") do
        let(:type) { "highest" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
          <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
          <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
          <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
          </albumList>
          </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("frequent") do
        let(:type) { "frequent" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
        <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          </albumList>
          </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("recent") do
        let(:type) { "recent" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
        <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          </albumList>
          </subsonic-response>'
        end

        p "EVERGREEEEEEN!!!"

        it_behaves_like "a successful request"
      end

      describe("alphabeticallyByName") do
        let(:type) { "alphabeticallyByName" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
        <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          </albumList>
          </subsonic-response>'
        end

        p "EVERGREEEEEEN!!!"
        it_behaves_like "a successful request"
      end

      describe("alphabeticalByArtist") do
        let(:type) { "alphabeticalByArtist" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
        <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          </albumList>
          </subsonic-response>'
        end

        p "EVERGREEEEEEN!!!"

        it_behaves_like "a successful request"
      end

      describe("starred") do
        let(:type) { "starred" }
        let(:expected_response) do
          '<?xml version="1.0" encoding="UTF-8"?>
        <subsonic-response xmlns="http://subsonic.org/restapi" status="ok" version="1.16.1">
        <albumList>
        <album id="7" title="Happy Nation" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.0" averageRating="2.9"/>
        <album id="5" title="Born in the U.S.A." artist="Randa Treutel" isDir="true" coverArt="22" userRating="2.5" averageRating="1.7"/>
        <album id="8" title="Rumours" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.5" averageRating="2.3"/>
        <album id="4" title="Frozen" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="3.9" averageRating="1.3"/>
        <album id="2" title="Breakfast in America" artist="Randa Treutel" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="3" title="Metallica" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="4.8" averageRating="2.8"/>
        <album id="1" title="Midnight Memories" artist="Tashina Bergnaum" isDir="true" coverArt="22" userRating="4.4" averageRating="1.6"/>
        <album id="6" title="Legend: The Best of Bob Marley &amp;amp; The Wailers" artist="Sharron Prohaska III" isDir="true" coverArt="22" userRating="1.6" averageRating="1.2"/>
          </albumList>
          </subsonic-response>'
        end

        it_behaves_like "a successful request"
      end

      describe("offset") do
        p "TBI offset"
      end

      describe("size") do
        p "TBI size"
      end
    end
  end
end
