# display an alphabetical list of all places (by name), as links to each place's page
get '/places' do
  @places = Place.all.sort_by { |place| place.name }
  erb :'/places/show_all'
end

# display 1 place and all of its comments
get '/places/:id' do |id|
  @place = Place.find(id)
  @comments = @place.comments
  erb :'/places/show'
end


