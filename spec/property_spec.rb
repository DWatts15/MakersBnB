require 'property'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      properties = Property.all

      expect(properties).to include("Property1")
      expect(properties).to include("Property2")
    end
  end
end