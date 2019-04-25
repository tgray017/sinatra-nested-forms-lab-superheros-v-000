require_relative 'config/environment.rb'
require "sinatra/activerecord/rake"

namespace :db do
  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "start console"
  task :console do
    Pry.start
  end
end