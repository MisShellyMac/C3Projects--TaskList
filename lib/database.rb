require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_name = "db/#{ database_name }"
      try_to_create_db
    end

    def try_to_create_db
      unless File.exists?(@database_name)
        db = SQLite3::Database.new(@database_name)
        db.execute "CREATE TABLE tasklist (id INTEGER PRIMARY KEY, Name TEXT NOT NULL, Description TEXT, Date_completed TEXT);"
      end
    end

    private

    def query!(statement, *params)
      db = SQLite3::Database.open(database_name)
      db.execute statement #, params
     rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end
