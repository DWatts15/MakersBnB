require 'pg'
# require 'signup'

class Property
  attr_reader :name, :price, :availability, :description, :id, :username

  def initialize(id:, name:, price:, availability:, description:, username:)
    @name = name
    @price = price
    @availability = availability
    @description = description
    @id = id
    @username = username
  end

  # display all properties. 'self' means that this is a class method, rather than the typical instance method.
  # connect to a database - if rspec is run, connect to the test database, otherwise connect to the production database
  # results is an array of all properties/rows. 
  # the map method creates a new array is used to display each row.
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM spaces;")
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], price: property['price'], 
        availability: property['availability'], description: property['description'], username: property['username'])
    end
  end

  #create a new property, add to database in a new row
  # the .create method accepts paramaters for name, price, availabaility, description, and username.
  # the relevant database is chosen and connected to
  # an SQL query is executed and result is assigned to 'result' variable - a new row is inserted into the spaces table, 
  # with columns name, price, availability, description and username. The values (in curly braces) entered 
  # are the paramters given to the method. One new Property is instantiated, has attributes of id, name etc. from the table.
  # name:, price:, availability: (in blue) refer to the paramters (NEED CHECKING), however 'result[0]['id']' is the first thing
  # found in the result array and the '[id]' here relates to the SQL database column value.
  def self.create(name:, price:, availability:, description:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO spaces (name, price, availability, description, username) VALUES('#{name}','#{price}', 
    '#{availability}', '#{description}', '#{username}') RETURNING id, name, price, availability, description, username;")

    Property.new(id: result[0]['id'], name: result[0]['name'], price: result[0]['price'], 
      availability: result[0]['availability'], description: result[0]['description'], username: result[0]['username'])
  end


  # This displays an individual property record based on ID from database
  # Connect to correct database. An SQL query is executed and assigned to the 'result' variable. The query selects all from
  # the spaces table where the data in the 'id' column matches the property_id parameter given to the method.
  # the .map method creates a new array of Property instances (though there will only be one element in this array
  # because it will only ever identify one property). The SQL query will return all columns for the row which relate to 
  # property_id. The data in these columns is used to instantiate one Property instance with these attributes.
  def self.individual(property_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM spaces WHERE id = '#{property_id}';")

    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], price: property['price'], 
        availability: property['availability'], description: property['description'], username: property['username'])
    end
  end


  #user can reserve a property
  def self.reserve(dates, property_id)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
      else
        connection = PG.connect(dbname: 'makersbnb')
      end

      result = connection.exec("UPDATE spaces SET reservation = '#{dates}' WHERE id = '#{property_id}';")

    end
  
  end

