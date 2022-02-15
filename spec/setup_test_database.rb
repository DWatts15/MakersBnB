require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  
  connection.exec("INSERT INTO spaces (name) VALUES('Property1');")
  connection.exec("INSERT INTO spaces (name) VALUES('Property2');")
  connection.exec("INSERT INTO spaces (name) VALUES('Property3');")
  connection.exec("INSERT INTO spaces (name) VALUES('Property4');")
end