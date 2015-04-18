get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

post '/places/:id/comments' do |id|
  place = Place.find(id)
  place.comments << Comment.create(params[:comment])
  if request.xhr?
    erb :'places/_comment', locals: {comment: @comment}
  else
    redirect "/places/#{id}"
  end
end