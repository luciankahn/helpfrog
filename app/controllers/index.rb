get '/' do
  erb :'index'
end

get '/results' do
  if params['address'].nil?
    redirect '/'
  else
    @address = params['address']
    if params['filter'] == ""
      filter_categories = Category.all.name
    else
      filter_categories = params['filter']
    end
    @places = Place.joins(:categories).near(@address).where("categories.name IN (?)", filter_categories).limit(30)
    @lat_longs = []
    @places.each do |place|
      @lat_longs << [place.latitude, place.longitude]
    end
    p @lat_longs.to_json
    erb :'/results'
    # google_maps.js needs to receive the @lat_longs json file in order to iterate through it and construct marker objects for the map on results.erb.
    # However, the list that appears below the map in results.erb needs @places in order to render. And results.erb needs to render as a result of this route.
    # How do I pass @lat_longs.to_json to google_maps.js AND @places to results.erb, AND render results.erb, from this route?
  end
end
