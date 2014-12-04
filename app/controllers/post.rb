#READ ALL
get '/posts/all' do

  erb :'posts/all'
end

#CREATE
get '/post/new' do
  erb :'posts/new'
end

post '/post' do
  if current_user
  @post = Post.create(title: params[:post][:title], content: params[:post][:content], user_id: current_user.id)



    if @post.invalid?
      session[:error] = @post.errors.messages
      redirect('/')
    else
      tag_array = params[:tag][:name].split(', ')
      tag_array.each do |tag|
        @post.tags.create(name: tag)
      end
      @post.resources.create(params[:resource])
      redirect('/')
    end
  else
    redirect('/')
  end
end

#READ ONE / ADD RESOURCE
get '/post/:id' do
  @post=Post.find(params[:id])
  # if @resource=Resource.create(params[:resource])
  #   redirect("/post/#{@post.id}")
  # end

  erb :'/posts/show'
end

#UPDATE

get '/post/:id/edit' do
  @post=Post.find(params[:id])
  erb :'/posts/update'
end

put '/post/:id' do
  post=Post.find(params[:id])
  if post.update(params[:post])
  redirect("/posts/#{post.id}")
  else
  session[:error]=post.errors.messages
  redirect("/post/#{post.id}/edit")
end
end

#DESTROY

delete '/post/:id' do
  @post=Post.find(params[:id])
  @post.destroy
  redirect ("/posts/all")
end
