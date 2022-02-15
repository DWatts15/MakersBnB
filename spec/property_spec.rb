require 'property'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      properties = Property.all

      expect(properties).to include("Property1 - £50 - Available - Good Location")
      expect(properties).to include("Property2 - £60 - Available - Bad Location")
    end
  end
end