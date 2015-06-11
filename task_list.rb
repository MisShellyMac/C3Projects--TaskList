require_relative 'lib/database'
require_relative 'lib/query'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    new_query = TaskList::Query.new("tasklist.db")
    @tasks = new_query.all_tasks
    erb :index
  end

  get "/add_task" do
    erb :add_task
  end

  post "/add_task" do
    @name = params[:name]
    @description = params[:description]
    @date_completed = params[:date_completed]
    new_query = TaskList::Query.new("tasklist.db")
    new_query.add_task(@name, @description, @date_completed)
    redirect '/'
  end


end
