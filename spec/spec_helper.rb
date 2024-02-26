# frozen_string_literal: true

# spec/spec_helper.rb

ENV["RACK_ENV"] = "test"

require_relative "../sinsonic"
require "rspec"
require "rack/test"
require "rspec/matchers" # req by equivalent-xml custom matcher `be_equivalent_to`
require "equivalent-xml"
require "database_cleaner"
require "factory_bot"

require_relative "shared/succedful_request"
require_relative "shared/album_list_request"

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.include FactoryBot::Syntax::Methods

  config.seed =  518_462

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def app
  Sinatra::Application
end
