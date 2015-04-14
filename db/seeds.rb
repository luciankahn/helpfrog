## Create Categories

Category.create(name: "disabilities services")
Category.create(name: "economic opportunity")
Category.create(name: "food stamps / SNAP / EBT")
Category.create(name: "housing assistance/advocacy")
Category.create(name: "LGBT services")
Category.create(name: "literacy programs")
Category.create(name: "senior services")
Category.create(name: "youth services")

## Import lgbt_resources.csv.
resources = CSV.read('db/lgbt_resources.csv')
resources.each do |resource|
  place = Place.new(name: resource[0],
            address: resource[1],
            phone_number: resource[2].to_s,
            description: resource[3].slice(0, 255)
            )
  place.geocode
  place.save
  place.categories << Category.find_or_create_by(name: "LGBT services")
end

