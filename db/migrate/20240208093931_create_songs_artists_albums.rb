# frozen_string_literal: true

class CreateSongsArtistsAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name

      t.timestamps
    end

    create_table :albums do |t|
      t.string :name
      t.references :artist, foreign_key: true

      t.timestamps
    end

    create_table :songs do |t|
      t.string :title
      t.float :duration
      t.references :artist, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
