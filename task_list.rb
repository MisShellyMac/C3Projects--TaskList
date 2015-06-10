require_relative 'lib/database'
require 'sinatra'
require 'sinatra/reloader'

class TaskList < Sinatra::Base
  register Sinatra::reloader
end
