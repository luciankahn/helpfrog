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
    erb :'/results'
  end
end