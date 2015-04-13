# list all places in one category
get '/categories/:id' do |id|
  @category = Category.find(id)
  @places = @category.places.paginate(:page => params[:page])
  erb :'/categories/show'
end
