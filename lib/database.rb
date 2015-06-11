require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_name = "db/#{ tasklist.db }"
    end



    private

    def query!(statement, *params)
      db = SQLite3::Database.new "tasklist.rb"
      db.execute statement, params
    rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end
