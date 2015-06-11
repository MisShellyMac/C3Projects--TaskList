require "sqlite3"

db = SQLite3::Database.new "db/tasklist.db"
db.execute "CREATE TABLE tasklist (id INTEGER PRIMARY KEY, Name TEXT NOT NULL, Description TEXT, Completed_date TEXT);"

db.close if db
