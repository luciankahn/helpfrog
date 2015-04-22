get '/' do
  erb :'index'
end

get '/results' do
  @address = params['address']
  if params['filter'] == ""
    filter_categories = Category.all.name
  else
    filter_categories = params['filter']
  end
  @places = Place.joins(:categories).near(@address).where("categories.name IN (?)", filter_categories).limit(30)
  if request.xhr?
    @lat_longs = []
    @places.each do |place|
      @lat_longs << [place.latitude, place.longitude]
    end
    @lat_longs.to_json
  else
    erb :'/results'
  end
end
