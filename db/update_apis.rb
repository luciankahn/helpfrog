# Run this rake task once a month to get new resources.

def api_call(json_url)
  response = open(json_url)
  JSON.parse(response.read)
end

# Handles NYC OpenData queries
def socrata_parse(json_url, category_names_array)
  collection = api_call(json_url)
  collection.each do |site|
    name = site["site_name"]
    address = site["location_1"]["human_address"]
    phone_number = site["contact_number"]
    latitude = site["location_1"]["latitude"]
    longitude = site["location_1"]["longitude"]
    place = Place.create_with(address: address, phone_number: phone_number, latitude: latitude, longitude: longitude).find_or_create_by(name: name)
    category_names_array.each do |cat|
      place.categories << Category.find_or_create_by(name: cat)
    end
  end
end

# DYCD After School Programs: Housing
socrata_parse('https://data.cityofnewyork.us/resource/fqcv-e9sg.json', ["housing", "youth"])

# Family Support Programs for Seniors
socrata_parse('https://data.cityofnewyork.us/resource/dhs7-q59e.json', ["seniors"])

# NEED ERROR HANDLING for missing columns, so the rake doesn't break.
# After School Programs for Runaway and Homeless Youth
socrata_parse('https://data.cityofnewyork.us/resource/ujsc-un6m.json', ["youth"])




### Additional Resources That Need Data Massage:

# Food Stamp Centers:
# https://data.cityofnewyork.us/Social-Services/Directory-of-Food-Stamp-Centers/tc6u-8rnp
# Need to string manipulate names.

# Young Adult Borough Centers
# Different table headers
# collection = api_call('https://data.cityofnewyork.us/resource/pfn4-vjwr.json')



## Testing (Comments)
all_places = Place.all
all_places.each do |place|
  place.comments << Comment.new(title: TubularFaker.name, content: TubularFaker.lingo)
end