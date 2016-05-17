get '/users/:user_id/posts/:post_id/comments/new' do
  logged_in?
  @post = Post.find(params[:post_id]) #define intstance variable for view
  @user = User.find(params[:user_id])
  @errors = nil

  if request.xhr?
    erb :'comments/new', layout: false , locals: {user: @user, post: @post}
  else
    erb :'comments/new', locals: {user: @user, post: @post}
  end

end


post '/users/:user_id/posts/:post_id/comments' do
  @post = Post.find(params[:post_id]) #define intstance variable for view
  @user = User.find(params[:user_id])
  @comment = @post.comments.new(body: params[:body], user_id: @user.id) #create new comment

  if @comment.save
    redirect "/users/#{@user.id}/posts/#{@post.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new'
  end

end
