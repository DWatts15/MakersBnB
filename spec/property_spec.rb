require 'property'
require 'database_helper'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      add_row_to_test_database
      
      properties = Property.all

      expect(properties.length).to eq 5
      expect(properties.first).to be_a Property
      expect(properties.first.id).to eq property.id
      expect(properties.first.name).to eq 'Property1'
      expect(properties.first.price).to eq '£50'
      expect(properties.first.availability).to eq 'Available'
      expect(properties.first.description).to eq 'Good location'
    end
  end

  describe '.create' do
    it 'creates a new property listing' do
      property = Property.create(name: "Property5", price: "£50", availability: "Available", description: "Good location").first
      persisted_data = persisted_data(id: property.id)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data['id']
      expect(property.name).to eq 'Property5'
      expect(property.price).to eq '£50'
      expect(property.availability).to eq 'Availability'
      expect(property.description).to eq 'Good location'
    end
  end
end