get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

post '/places/:id/comments' do |id|
  if request.xhr?
    # something goes here to find the new comment
    erb: 'places/_new-comment', locals: {comment: @comment}
  else
    place = Place.find(id)
    place.comments << Comment.create(params[:comment])
    redirect "/places/#{id}"
  end
end