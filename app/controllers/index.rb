get '/' do
  erb :'index'
end

get '/results' do
  p "XXXXXXXXXXXXXXXXXXZXXXXXXXX"
  p request
  p params
  @address = params['address']
  if params['filter'] == ""
    filter_categories = Category.all.name
  else
    filter_categories = params['filter']
  end
  @places = Place.joins(:categories).near(@address).where("categories.name IN (?)", filter_categories).limit(30)
  # debug this. my ajax call in application.js is succeeding but receiving an empty array.
  if request.xhr?
    p @places
    @lat_longs = []
    @places.each do |place|
      @lat_longs << place.latitude
    end
    puts "Here is @lat_longs: #{@lat_longs}"
    @lat_longs.to_json
  else
    erb :'/results'
  end
end
