# Run this rake task once a month to get new resources.

def api_call(json_url)
  response = open(json_url)
  JSON.parse(response.read)
end

# Handles NYC OpenData queries
def socrata_parse_nyc(json_url, category_names_array)
  collection = api_call(json_url)
  collection.each do |site|
    next if site["site_name"].nil? || site["location_1"].nil? || site["location_1"]["human_address"].nil? || site["contact_number"].nil? || site["location_1"]["latitude"].nil? || site["location_1"]["longitude"].nil?
    name = site["site_name"]
    address = site["location_1"]["human_address"]
    phone_number = site["contact_number"]
    latitude = site["location_1"]["latitude"]
    longitude = site["location_1"]["longitude"]
    place = Place.create(name: name, address: address, phone_number: phone_number, latitude: latitude, longitude: longitude)
    category_names_array.each do |cat|
      place.categories << Category.find_or_create_by(name: cat)
    end
  end
end

def socrata_parse_ny_state(json_url, category_names_array)
  collection = api_call(json_url)
  collection.each do |site|
    next if site["service_provider"].nil? || site["street_address"].nil? || site["phone"].nil? || site["location_1"].nil? || site["location_1"]["latitude"].nil? || site["location_1"]["longitude"].nil?
    name = site["service_provider"]
    address = site["street_address"]
    phone_number = site["phone"]
    latitude = site["location_1"]["latitude"]
    longitude = site["location_1"]["longitude"]
    place = Place.create(name: name, address: address, phone_number: phone_number, latitude: latitude, longitude: longitude)
    category_names_array.each do |cat|
      place.categories << Category.find_or_create_by(name: cat)
    end
  end
end

####### NY State

# Directory of Developmental Disabilities Service Provider Agencies
# https://data.ny.gov/Human-Services/Directory-of-Developmental-Disabilities-Service-Pr/ieqx-cqyk
socrata_parse_ny_state('https://data.ny.gov/resource/ieqx-cqyk.json', ["disabilities"])

######## NYC

# DYCD After School Programs: Reading And Writing Literacy Programs
# Source Table: https://data.cityofnewyork.us/Education/DYCD-after-school-programs-Reading-And-Writing-Lit/w9cy-nnma
socrata_parse_nyc('https://data.cityofnewyork.us/resource/w9cy-nnma.json', ["literacy", "education"])

# DYCD After School Programs: Housing
# Source Table: https://data.cityofnewyork.us/Social-Services/DYCD-after-school-programs-Housing/fqcv-e9sg
socrata_parse_nyc('https://data.cityofnewyork.us/resource/fqcv-e9sg.json', ["housing", "youth"])

# Senior Center Directory
# Source Table: https://data.cityofnewyork.us/Social-Services/Senior-Center-Directory/kpt7-myy2
socrata_parse_nyc('https://data.cityofnewyork.us/resource/kpt7-myy2.json', ["seniors"])

# Family Support Programs for Seniors
# Source Table: https://data.cityofnewyork.us/Social-Services/DYCD-after-school-programs-Family-Support-Programs/dhs7-q59e
socrata_parse_nyc('https://data.cityofnewyork.us/resource/dhs7-q59e.json', ["seniors"])

# After School Programs for Runaway and Homeless Youth
# Source Table: https://data.cityofnewyork.us/Social-Services/DYCD-after-school-programs-Runaway-And-Homeless-Yo/ujsc-un6m
socrata_parse_nyc('https://data.cityofnewyork.us/resource/ujsc-un6m.json', ["youth"])

# Food Stamp Centers:
# https://data.cityofnewyork.us/Social-Services/Directory-of-Food-Stamp-Centers/tc6u-8rnp
collection = api_call('https://data.cityofnewyork.us/resource/tc6u-8rnp.json')
collection.each do |site|
  next if site["facility_name"].nil? || site["street_address"].nil? || site["phone_number_s_"].nil?
  name = site["facility_name"] + " Food Stamp Center"
  address = site["street_address"]
  phone_number = site["phone_number_s_"]
  # need to geocode latitude and longitude. how?
  place = Place.create(name: name, address: address, phone_number: phone_number)

  category_names_array.each do |cat|
    place.categories << Category.find_or_create_by(name: cat)
  end
end


### Additional Resources That Need Data Massage:



# Young Adult Borough Centers
# Different table headers
# socrata_parse_nyc('https://data.cityofnewyork.us/resource/pfn4-vjwr.json', ["youth", "education"])



## Testing (Comments)
# all_places = Place.all
# all_places.each do |place|
#   place.comments << Comment.new(title: TubularFaker.name, content: TubularFaker.lingo)
# end