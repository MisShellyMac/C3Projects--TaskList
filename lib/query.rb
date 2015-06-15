module TaskList
  class Query < Database

    def add_task(name, description, date_completed)
      # prepare statement
      statement = "INSERT INTO tasklist (Name, Description, Date_completed) VALUES ('#{name}', '#{description}', '#{date_completed}');"

      # call `query!` to interact with the database
      query!(statement)
    end

    def all_tasks

      statement = "SELECT * FROM tasklist;"
      query!(statement)
    end
  end
end
