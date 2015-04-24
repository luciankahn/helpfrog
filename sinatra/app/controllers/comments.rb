get '/places/:id/comments' do |id|
  redirect "/places/#{id}"
end

post '/places/:id/comments' do |id|
  place = Place.find(id)
  comment = Comment.create(params[:comment])
  place.comments << comment
  if request.xhr?
    erb :'places/_comment', layout: false, locals: {comment: comment}
  else
    redirect "/places/#{id}"
  end
end

# edit a comment
put 'comments/:comment_id' do |comment_id|
  comment = Comment.find(id)
  comment.update(params[:comment])
  if response.xhr?
    erb :'places/_edit_comment', layout: false, locals: {comment: comment}
  else
    # provide functionality for non-JS users
  end
end

# delete a comment
