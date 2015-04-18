get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

# non-AJAX version
post '/places/:id/comments' do |id|
  place = Place.find(id)
  place.comments << Comment.create(params[:comment])
  redirect "/places/#{id}"
end