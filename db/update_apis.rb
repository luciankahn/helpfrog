# Run this rake task once a month to get new resources.

# Handles NYC OpenData queries
def socrata_parse(json_url, category)
  response = open(json_url)
  collection = JSON.parse(response.read)
  collection.each do |site|
    name = site["site_name"]
    address = site["location_1"]["human_address"]
    phone_number = site["contact_number"]
    latitude = site["location_1"]["latitude"]
    longitude = site["location_1"]["longitude"]
    Place.create_with(category: category, address: address, phone_number: phone_number, latitude: latitude, longitude: longitude).find_or_create_by(name: name)
  end
end

# DYCD After School Programs: Housing
socrata_parse('https://data.cityofnewyork.us/resource/fqcv-e9sg.json', :housing)

# NEED ERROR HANDLING for missing columns, so the rake doesn't break.
# After School Programs for Runaway and Homeless Youth
socrata_parse('https://data.cityofnewyork.us/resource/ujsc-un6m.json', :youth)


