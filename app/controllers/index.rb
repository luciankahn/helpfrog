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
  end
  if request.xhr?
    @lat_longs = []
    @places.each do |place|
      @lat_longs << [place.latitude, place.longitude]
    end
    p @lat_longs.to_json
  else
    erb :'/results'
  end
end
