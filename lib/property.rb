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



end
