require_relative 'lib/database'
require_relative 'lib/query'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  #Displays full task list on home page and ensures that after user has input
  #add task it returns to the homepage with new item at bottom.
  get "/" do
    new_query = TaskList::Query.new("tasklist.db")
    @tasks = new_query.all_tasks
    erb :index
  end

  #Directs user to secondary page to input new task.
  get "/add_task" do
    erb :add_task
  end

  #Creates instance variables in Query class and redirects to homepage.
  post "/add_task" do
    @name = params[:name]
    @description = params[:description]
    @completed = params[:completed]
    @date_completed = params[:date_completed]

    new_query = TaskList::Query.new("tasklist.db")
    new_query.add_task(@name, @description, @completed, @date_completed)
    redirect '/'
  end


end
