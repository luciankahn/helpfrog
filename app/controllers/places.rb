# display 1 place and all of its comments
get '/places/:id' do |id|
  @place = Place.find(id)
  @comments = @place.comments
  erb :'/places/show'
end