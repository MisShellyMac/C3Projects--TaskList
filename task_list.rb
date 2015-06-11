require_relative 'lib/database'
require_relative 'lib/query'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

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

    q = TaskList::Query.new("tasklist.db")
    q.add_task(@name, @description, @date_completed)
    redirect '/'
    erb :index
  end


end
