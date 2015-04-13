## Create Categories

Category.create(name: "disabilities")
Category.create(name: "education")
Category.create(name: "food stamps")
Category.create(name: "housing")
Category.create(name: "lgbt")
Category.create(name: "literacy")
Category.create(name: "seniors")
Category.create(name: "youth")

## Import lgbt_resources.csv.

resources = CSV.read('lgbt_resources.csv')
resources.each do |resource|
  place = Place.new(name: resource[0],
            address: resource[1],
            phone_number: resource[2].to_s,
            description: resource[3]
            )
  place.geocode
  place.save
  place.categories << Category.find_or_create_by(name: "lgbt_resources")
end