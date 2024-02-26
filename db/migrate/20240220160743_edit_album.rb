# frozen_string_literal: true

class EditAlbum < ActiveRecord::Migration[7.1]
  def change
    rename_column :albums, :name, :title
    add_column :albums, :play_count, :integer
    add_column :albums, :last_played_at, :date
    add_column :albums, :starred, :boolean
    add_column :albums, :year, :integer
  end
end
