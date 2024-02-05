# frozen_string_literal: true

# Rakefile
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./sinsonic"
  end
end
