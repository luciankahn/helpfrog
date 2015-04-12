## Testing Comments
all_places = Place.all
all_places.each do |place|
  place.comments << Comment.new(title: TubularFaker.name, content: TubularFaker.lingo)
end