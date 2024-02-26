# frozen_string_literal: true

# sinsonic.rb

require "sinatra"
require "json"
require "sinatra/activerecord"
require "puma"
require "nokogiri"

set :database_file, "config/database.yml"
set :server, :puma

# Custom middleware to log requests
class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    puts "Request: #{request.request_method} #{request.path}"
    @app.call(env)
  end
end

use RequestLogger

def subsonic_xml_response(&block)
  builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
    xml.send("subsonic-response", xmlns: "http://subsonic.org/restapi", version: "1.16.1", status: "ok") do
      block.call(xml) if block_given?
    end
  end
  builder.to_xml
end

Dir[File.join(__dir__, "models", "*.rb")].each { |file| require_relative file }
Dir[File.join(__dir__, "routes", "*.rb")].each { |file| require_relative file }
