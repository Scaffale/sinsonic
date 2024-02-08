# frozen_string_literal: true

# sinsonic.rb

require "sinatra"
require "json"
require "sinatra/activerecord"
require "puma"
require "nokogiri"


class Sinsonic < Sinatra::Application
  set :database_file, "config/database.yml"
  set :server, :puma

  # Subsonic API startScan.view endpoint
  post "/rest/startScan.view" do
    content_type :xml

    # Here you would initiate a scan of your media folders.
    # This could involve iterating over the files in your media folders,
    # checking for new or updated files, and updating your database as needed.
    # The specifics would depend on how your application is structured and how
    # you're storing your media files.

    # For now, let's just return a placeholder response.
    subsonic_xml_response do |xml|
      xml.send("scanStatus", scanning: "true", count: "5422")
    end
  end

  def subsonic_xml_response(&block)
    builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
      xml.send("subsonic-response", xmlns: "http://subsonic.org/restapi", version: "1.16.1", status: "ok") do
        block.call(xml) if block_given?
      end
    end
    builder.to_xml
  end
end

require_relative "routes/system"
