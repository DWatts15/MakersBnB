require 'pg'

class Property
  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM spaces;")
    result.map { |property| property['name']}
  end
end
