$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "sinatra"
require "active_record"
require "active_support/all"
require "json"
require "slack-ruby-client"

unless Sinatra::Base.production?
  require "dotenv"
  Dotenv.load
end

require "emilie"
require "slack"

require "app"

ActiveRecord::Base.establish_connection(Emilie.config[:active_record])
