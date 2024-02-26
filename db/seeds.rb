# frozen_string_literal: true

require_relative "../helpers/media_scanner"
# require "factory_bot"

# FactoryBot.find_definitions

# puts ActiveRecord::Base.connection.current_database
# if ENV["RACK_ENV"] == "test"
#   puts "Creating 10 albums"
#   FactoryBot.create_list(:album, 10)
# else
#   init_scan
# end

init_scan
