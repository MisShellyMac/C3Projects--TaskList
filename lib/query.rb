module TaskList
  class Query < Database
#this will go in a separate class at a later time.

    def add_task(name, description, date_completed)
      # santitize/validate your arguments
      @name = name
      @description = description
      @date_completed = date_completed
      # prepare your statement

      @statement = "INSERT INTO taskList (Name, Description, Date_completed) VALUES (#{@name}, #{@description}, #{@date_completed});"

      # call `query!` to interact with the database
      query!(@statement, @name, @description, @date_completed)

      # determine what should be returned
      
    end

  end
end
