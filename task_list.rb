require_relative 'lib/database'
require 'sinatra'
require 'sinatra/reloader'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :index
  end

  get "/add_task" do
    erb :add_task
  end

end
