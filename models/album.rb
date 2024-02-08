# frozen_string_literal: true

require "sinatra/activerecord"

class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :artist, presence: true
end
