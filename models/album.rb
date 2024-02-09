# frozen_string_literal: true

require "sinatra/activerecord"

class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :artist, presence: true

  def to_xml_list
    {
      id:,
      name:,
      artist: artist.name,
      isDir: true,
      coverArt: 22, # cover_art.id
      userRating: user_rating,
      averageRating: average_rating
    }
  end
end
