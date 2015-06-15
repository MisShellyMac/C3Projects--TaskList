require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name
    #Creating new database instance and also calls try_to_create_db method
    def initialize(database_name)
      @database_name = "db/#{ database_name }"
      try_to_create_db
    end

    #checks for existence of file. If file DOES NOT exist, it will create one.
    def try_to_create_db
      unless File.exists?(@database_name)
        db = SQLite3::Database.new(@database_name)
        db.execute "CREATE TABLE tasklist (id INTEGER PRIMARY KEY, Name TEXT NOT NULL, Description TEXT, Completed TEXT, Date_completed TEXT);"
      end
    end

    private

    #Takes Statment and executes on open database. Returns Error if problems accessing
    #database arise and lastly ensures database closes at end.
    def query!(statement, *params)
      db = SQLite3::Database.open(database_name)
      db.execute statement #, params
      rescue SQLite3::Exception => error
        raise "Error retrieving from database."
        puts error.inspect
      ensure
      db.close if db
    end
  end
end
