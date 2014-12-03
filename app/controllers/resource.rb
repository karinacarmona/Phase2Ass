#CREATE
get '/resource/new' do
  erb :'post/show'
end

post '/resource' do
@resource= Resource.create(params[:resource])

end


@post = Post.create(params[:post])

if @post.invalid?
  session[:error] = @post.errors.messages
  redirect('/posts/new')
else
  tag_array = params[:tag][:name].split(', ')
  tag_array.each do |tag|
    @post.tags.create(name: tag)
  end
  @post.resources.create(params[:resource])
  redirect('/posts/all')
end
