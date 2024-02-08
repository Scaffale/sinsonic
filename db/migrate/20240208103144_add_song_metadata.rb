# frozen_string_literal: true

class AddSongMetadata < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :track, :integer
    add_column :songs, :track_total, :integer
    add_column :songs, :year, :integer
    add_column :songs, :disc, :integer
    add_column :songs, :disc_total, :integer
    add_column :songs, :lyrics, :text
    add_column :songs, :bitrate, :integer
    add_column :songs, :file_name, :string
    add_column :songs, :file_size, :integer
    add_column :songs, :file_modified_time, :datetime
  end
end
