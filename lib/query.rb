module TaskList
  class Query < Database
#this will go in a separate class at a later time.

    def add_task(*args)
      db = SQLite3::Database.open "taskList.db"
      db.execute "INSERT INTO taskList (Name, Description, Date_completed) VALUES (#{args[0]}, #{args[1]}, #{args[2]});"

# santitize/validate your arguments

# prepare your statement

# call `query!` to interact with the database

# determine what should be returned
    end

  end
end
