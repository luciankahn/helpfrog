get '/' do
  erb :'index'
end

post '/' do
  if params['address'].nil?
    redirect '/'
  else
    @address = params['address']
    if params['filter'] == ""
      @filter = Category.all.name # This isn't getting assigned.
    else
      @filter = params['filter']  # This isn't getting assigned properly from index.erb.
    end
    puts "Filter: #{params['filter']}"
    erb :'/results'
  end
end