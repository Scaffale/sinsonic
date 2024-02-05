# frozen_string_literal: true

# spec/spec_helper.rb

ENV["RACK_ENV"] = "test"

require_relative "../sinsonic"
require "rspec"
require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
