# frozen_string_literal: true

require "wahwah"
require "pry"
require "parallel"

def init_scan
  media_folder = "/media"
  media_files = Dir.glob(File.join(media_folder, "**/*.{mp3,wav,flac,aac,ogg}"))

  Parallel.map(media_files) do |file|
    find_or_create_song(file)
  end
end

def find_or_create_song(file)
  return if Song.where(file_name: file).exists?

  tags = extract_tags(file)
  Song.create!(tags.merge(extract_metadata(file)))
end

def extract_tags(file)
  tag = WahWah.open(file)
  artist = Artist.find_or_create_by!(name: tag.artist)
  album = Album.find_or_create_by!(title: tag.album, artist:)
  {
    title: tag.title,
    year: tag.year,
    duration: tag.duration,
    bitrate: tag.bitrate,
    track: tag.track,
    track_total: tag.track_total,
    disc: tag.disc,
    disc_total: tag.disc_total,
    lyrics: tag.lyrics,
    artist:,
    album:
  }
end

def extract_metadata(file)
  file_metadata = File.stat(file)

  {
    file_name: file,
    file_size: file_metadata.size,
    file_modified_time: file_metadata.mtime
  }
end
