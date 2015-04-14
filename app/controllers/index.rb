get '/' do
  erb :'index'
end

post '/' do
  if params['address'].nil?
    redirect '/'
  else
    @address = params['address']
    if params['filter'].nil?
      @filter = Category.all.name # This isn't getting assigned.
    else
      @filter = params['filter']  # This isn't getting assigned properly from index.erb.
    end
    erb :'/results'
  end
end