# frozen_string_literal: true

# sinsonic.rb

require "sinatra"
require "json"
require "sinatra/activerecord"
require "puma"

set :database_file, "config/database.yml"
set :server, :puma

# Subsonic API ping.view endpoint
get "/rest/ping.view" do
  content_type :json
  { status: "ok" }.to_json
end

# Subsonic API getLicense.view endpoint
get "/rest/getLicense.view" do
  content_type :json
  { license: { valid: true, email: "user@example.com", key: "your_license_key" } }.to_json
end
