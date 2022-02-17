require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE spaces;")
end

def add_row_to_test_database
  visit('/signup')

  page.fill_in 'username', with: 'Test username'
  page.fill_in 'password', with: 'Test password'

  click_button('submit')

  connection = PG.connect(dbname: 'login')
  connection.exec("INSERT INTO login_details (username, password) VALUES ('test username', 'test password');")

  # result = connection.exec('SELECT * FROM login_details;')

  page.fill_in 'username_login', with: 'test username'
  page.fill_in 'password_login', with: 'test password'

  click_button('submit_login')

  # connection = PG.connect(dbname: 'login')
  # result = connection.exec('SELECT username, password FROM login_details;')

  Property.create(name: "Property1", price: "£50", availability: "Available", description: "Good location", username: "Dummy_user")
  Property.create(name: "Property2", price: "£40", availability: "Available", description: "Bad location", username: "Dummy_user")
  Property.create(name: "Property3", price: "£60", availability: "Unavailable", description: "Swimming Pool", username: "Dummy_user")
  Property.create(name: "Property4", price: "£70", availability: "Available", description: "Rooftop bar", username: "Dummy_user")
end

