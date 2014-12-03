#CREATE

post '/post/:id/resource' do
  @post= Post.find(params[:id])
  @resource= Resource.create(title:params[:resource][:title],
   resource_url: params[:resource][:resource_url], post_id:@post.id, user_id: current_user )
  redirect("/post/#{@post.id}")
end
