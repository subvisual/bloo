require "rake"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/activerecord/rake"

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/app")

set :database_file, "config/database.yml" if File.exists?("config/database.yml")
require "boot"

if %i(development test).include? Sinatra::Base.environment
  namespace :lint do
    require "rubocop/rake_task"
    RuboCop::RakeTask.new(:ruby)
  end
end

desc "Run all linters"
task lint: %i(lint:ruby)

task default: :lint
