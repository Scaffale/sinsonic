# frozen_string_literal: true

require "sinatra/activerecord"

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album

  validates :file_name, presence: true
  validates :duration, numericality: { greater_than: 0 }
end
