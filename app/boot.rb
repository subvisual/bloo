# Require all gems
require "sinatra"
require "sinatra/activerecord"
require "active_support/all"
require "classifier-reborn"
require "json"
require "slack-ruby-client"
require "satellite"

unless Sinatra::Base.production?
  require "dotenv"
  Dotenv.load
end

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

set :database_file, "../config/database.yml" if File.exists?("../config/database.yml")

# Require models
require "models/user"

# Require lib and utils
require "lib/classifier"
require "lib/satellite"

# Define Bloo and configs
require "bloo"

# Require components
require "slack"

require "app"

Bloo::Satellite.instance.liftoff
