get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

post '/places/:id/comments' do |id|
  place = Place.find(id)
  comment = Comment.create(params[:comment])
  place.comments << comment
  byebug
  if request.xhr?
    erb :'places/_comment', locals: {comment: comment}
  else
    redirect "/places/#{id}"
  end
end