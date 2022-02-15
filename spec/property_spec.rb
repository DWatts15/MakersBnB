require 'property'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      # connection = PG.connect(dbname: 'makersbnb_test')

      # # Add the test data
      # connection.exec("INSERT INTO spaces (name) VALUES ('Property3');")
      # connection.exec("INSERT INTO spaces (name) VALUES ('Property4');")
      add_row_to_test_database
      
      properties = Property.all

      expect(properties).to include("Property1")
      expect(properties).to include("Property2")
      expect(properties).to include("Property3")
      expect(properties).to include("Property4")
    end
  end
end