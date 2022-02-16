require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  Property.create(name: "Property1", price: "£50", availability: "Available", description: "Good location")
  Property.create(name: "Property2", price: "£40", availability: "Available", description: "Bad location")
  Property.create(name: "Property3", price: "£60", availability: "Unavailable", description: "Swimming Pool")
  Property.create(name: "Property4", price: "£70", availability: "Available", description: "Rooftop bar")
end