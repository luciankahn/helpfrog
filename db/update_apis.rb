# Run this rake task once a month to get new resources.

# After School Programs for Runaway and Homeless Youth
# NYC Open Data Portal
response = open('https://data.cityofnewyork.us/resource/ujsc-un6m.json')
homeless_youth_collection = JSON.parse(response.read)
homeless_youth_collection.each do |site|
  name = site["site_name"]
  category = :youth
  address = site["location_1"]["human_address"]
  latitude = site["location_1"]["latitude"]
  longitude = site["location_1"]["longitude"]
  Place.create_with(category: category, address: address, latitude: latitude, longitude: longitude).find_or_create_by(name: name)
end
