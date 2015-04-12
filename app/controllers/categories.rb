# list all places in one category
get '/categories/:id' do |id|
  @category = Category.find(id)
  @places = @category.places
  erb :'/categories/show'
end
