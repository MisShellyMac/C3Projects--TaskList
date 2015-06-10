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

  post "/add_task" do
    @name = params[:name]
    @description = params[:description]
    @date_completed = params[:date_completed]
    erb :add_task
  end


end
