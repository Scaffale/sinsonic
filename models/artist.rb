# frozen_string_literal: true

require "sinatra/activerecord"

class Artist < ActiveRecord::Base
  has_many :songs

  validates :name, presence: true
end
