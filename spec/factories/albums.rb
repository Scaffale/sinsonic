# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :album do
    title { Faker::Music.album }
    artist { create(:artist) }
    songs_count { Faker::Number.between(from: 1, to: 20) }
    duration { Faker::Number.decimal(l_digits: 2) }
    user_rating { Faker::Number.between(from: 1.0, to: 5.0) }
    average_rating { Faker::Number.between(from: 1.0, to: 5.0) }
    play_count { Faker::Number.between(from: 1, to: 1000) }
    last_played_at { Faker::Time.backward(days: 365) }
    starred { Faker::Boolean.boolean }
    year { Faker::Number.between(from: 1900, to: 2022) }
  end
end
