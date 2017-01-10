$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "sinatra"
require "active_record"
require "active_support/all"
require "dotenv"
require "json"
require "slack-ruby-client"

require "emilie"
require "slack"

require "app"

Dotenv.load unless Sinatra::Base.production?

ActiveRecord::Base.establish_connection(Emilie.config[:active_record])
