require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'returns a collection of places that have the category/categories specified by the user' do
    address = '14th St. and 6th Ave., New York, NY'
    filter_categories = ['youth services', 'LGBT services', 'economic opportunity']
    places = Place.find_places_near(address, filter_categories)
    # in the return array, each of the place-objects's category is in the filter categories array
    places.each do |place|
      place.categories.each do |category|
        expect(filter_categories).to include(category)
      end
    end
  end

end
