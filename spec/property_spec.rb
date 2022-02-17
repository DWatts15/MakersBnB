require 'property'
require 'database_helper'

describe Property do
  describe '.all' do
    it 'returns all properties' do
      property = Property.create(name: "Property1", price: "£50", availability: "Available", description: "Good location", username: "Dummy_user")
      Property.create(name: "Property2", price: "£40", availability: "Available", description: "Bad location", username: "Dummy_user")
      Property.create(name: "Property3", price: "£60", availability: "Unavailable", description: "Swimming Pool", username: "Dummy_user")
      Property.create(name: "Property4", price: "£70", availability: "Available", description: "Rooftop bar", username: "Dummy_user")
          
      properties = Property.all

      expect(properties.length).to eq 4
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
      property = Property.create(name: "Property5", price: "£50", availability: "Available", description: "Good location")
      persisted_data = persisted_data(id: property.id)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data['id']
      expect(property.name).to eq 'Property5'
      expect(property.price).to eq '£50'
      expect(property.availability).to eq 'Available'
      expect(property.description).to eq 'Good location'
    end
  end
end