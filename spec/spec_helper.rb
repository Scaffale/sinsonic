# frozen_string_literal: true

# spec/spec_helper.rb

ENV["RACK_ENV"] = "test"

require_relative "../sinsonic"
require "rspec"
require "rack/test"
require "rspec/matchers" # req by equivalent-xml custom matcher `be_equivalent_to`
require "equivalent-xml"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
