# frozen_string_literal: true

class UpdateAlbumAttributes < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :songs_count, :integer
    add_column :albums, :duration, :float
    add_column :albums, :user_rating, :float
    add_column :albums, :average_rating, :float
    add_column :albums, :play_count, :integer
    add_column :albums, :last_played_at, :datetime
    add_column :albums, :starred, :boolean
  end
end
