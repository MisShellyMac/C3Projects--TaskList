module TaskList
  class Query < Database
#this will go in a separate class at a later time.

    def add_task(name, description, date_completed)
      # santitize/validate your arguments

      # prepare your statement

      statement = "INSERT INTO tasklist (Name, Description, Date_completed) VALUES ('#{name}', '#{description}', '#{date_completed}');"

      # call `query!` to interact with the database
      query!(statement)

      # determine what should be returned

    end

    def all_tasks
      # @database_name = "db/tasklist.db"
      #  db = SQLite3::Database.open @database_name
      #  db.execute "SELECT * FROM tasklist;"
         statement = "SELECT * FROM tasklist;"
         tasks = query!(statement)
         tasks = tasks.map do |task|
           "#{task[0]}. #{task[1]} - #{task[2]}, completed on #{task[3]}"
         end
        #  tasks.each do |string|
        #    puts string
        #  end
      #  rescue SQLite3::Exception
      #   db.close if db
    end
  end
end
