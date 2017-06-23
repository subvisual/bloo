$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

# Require all gems
require "sinatra"
require "sinatra/activerecord"
require "active_support/all"
require "classifier-reborn"
require "httparty"
require "json"
require "slack-ruby-client"

unless Sinatra::Base.production?
  require "dotenv"
  Dotenv.load
end

# Require lib and utils
require "lib/net"
require "lib/classifier"

# Define Bloo and configs
require "bloo"

# Require components
require "slack"

require "app"

set :database_file, "../config/database.yml"
