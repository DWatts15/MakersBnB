require 'pg'

class Property
  attr_reader :name, :price, :availability, :description, :id

  def initialize(id:, name:, price:, availability:, description:)
    @name = name
    @price = price
    @availability = availability
    @description = description
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM spaces;")
    result.map do |property| 
      Property.new(id: property['id'], name: property['name'], price: property['price'], availability: property['availability'], description: property['description'])
    end
  end

  def self.create(name:, price:, availability:, description:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO spaces (name, price, availability, description) VALUES('#{name}','#{price}', 
    '#{availability}', '#{description}') RETURNING id, name, price, availability, description;")

    Property.new(id: result[0]['id'], name: result[0]['name'], price: result[0]['price'], 
      availability: result[0]['availability'], description: result[0]['description'])
  end
end
