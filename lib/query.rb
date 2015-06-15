module TaskList
  class Query < Database

    #This method is for adding a new task to existing tasklist database with
    #3 parameters. Only the name is required and the last two inputs are optional.
    def add_task(name, description, date_completed)
      # prepare statement
      statement = "INSERT INTO tasklist (Name, Description, Date_completed) VALUES ('#{name}', '#{description}', '#{date_completed}');"

      # call `query!` to interact with the database
      query!(statement)
    end


    # This is used to display complete task list on front page.
    def all_tasks
      statement = "SELECT * FROM tasklist;"
      query!(statement)
    end
  end
end
