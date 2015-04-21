get '/' do
  erb :'index'
end

post '/' do
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

    # I need to send
    # @places.each "place.latitude, place.longitude"
    # to google_maps.js, to construct markers to put on the google map.
    # Does this entire route need to be an AJAX call instead? How?

    erb :'/results'
  end
end
