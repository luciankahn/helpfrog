get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

post '/places/:id/comments' do |id|
  place = Place.find(id)
  place.comments << Comment.create(params[:comment])
  redirect "/places/#{id}" # non-AJAX version
end