# frozen_string_literal: true

require "sinatra/activerecord"

class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :artist, presence: true

  scope :random, -> { order("RANDOM()") }
  scope :newest, -> { order("created_at DESC") }
  scope :highest, -> { order("user_rating DESC") }
  scope :frequent, -> { order("play_count DESC") }
  scope :recent, -> { order("last_played_at DESC") }
  scope :alphabetical_by_name, -> { order("title ASC") }
  scope :alphabetical_by_artist, -> { joins(:artist).order("artists.name ASC") }
  scope :starred, -> { where(starred: true) }
  scope :by_year, ->(from_year:, to_year:) { where("year < ? AND year > ?", to_year, from_year) }
  scope :by_genre, ->(genre) { where(genre:) }

  def to_xml_list
    {
      id:,
      title:,
      artist: artist.name,
      isDir: true,
      coverArt: 22, # cover_art.id
      userRating: user_rating,
      averageRating: average_rating
    }
  end
end
