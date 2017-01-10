$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "sinatra"
require "active_record"
require "active_support/all"

require "emilie"

require "app"

ActiveRecord::Base.establish_connection(Emilie.active_record_config)

if __FILE__ == $PROGRAM_NAME
  Emilie::App.run!
end
