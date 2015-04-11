# make api calls.
# get api collection objects.
# use find_or_create_by to add additional Place objects to database.

# After School Programs for Runaway and Homeless Youth
# NYC Open Data Portal
response = open('https://data.cityofnewyork.us/resource/ujsc-un6m.json')
homeless_youth_collection = JSON.parse(response.read)
homeless_youth_collection.each do |site|
  name = site["site_name"]
  category = :youth
  address = site["location_1"]["human_address"]

end