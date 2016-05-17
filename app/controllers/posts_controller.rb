get '/posts' do
  @posts = Post.all.reverse #define instance variable for view

  erb :'posts/index' #show all posts view (index)

end

get '/users/:user_id/posts/new' do
  logged_in?
  @user = User.find(params[:user_id])
  if @user.id == current_user.id
    erb :'posts/new' #show new posts view
  else
    redirect "/users/#{current_user.id}/posts/new"
  end

end

post '/users/:user_id/posts' do

  #below works with properly formatted params in HTML form
  @post = current_user.posts.new(params[:post]) #create new post

  if @post.save #saves new post or returns false if unsuccessful
    @post.images.create(name: params[:image]) if params[:image]
    redirect '/posts' #redirect back to posts index page
  else
    @errors = @post.errors.full_messages
    erb :'posts/new' # show new posts view again(potentially displaying errors)
  end

end


get '/users/:user_id/posts/:post_id' do
  logged_in?
  #gets params from url
  @user = User.find(params[:user_id])
  @post = Post.find(params[:post_id]) #define instance variable for view

  erb :'posts/show' #show single post view

end

get '/users/:user_id/posts/:post_id/edit' do
  logged_in?
  #get params from url
  @post = Post.find(params[:post_id]) #define intstance variable for view
  @user = User.find(params[:user_id])
  if @user.id == current_user.id
    if request.xhr?

      erb :'posts/edit', layout: false , locals: {post: @post}
    else
      erb :'posts/edit', locals: {post: @post}
    end
  else
    redirect "/users/#{@user.id}/posts/#{@post.id}"
  end
end

put '/users/:user_id/posts/:post_id' do

  #get params from url
  @post = Post.find(params[:post_id]) #define variable to edit
  @user = User.find(params[:user_id])
  @image = @post.images.new(name: params[:image])

  @post.assign_attributes(params[:post]) #assign new attributes
  if @post.save && @image.save #saves new post or returns false if unsuccessful
    redirect '/posts' #redirect back to posts index page
  else
    erb :'posts/edit' #show edit post view again(potentially displaying errors)
  end

end

delete '/posts/:post_id' do

  #get params from url
  @post = Post.find(params[:id]) #define post to delete

  @post.destroy #delete post

  redirect '/posts' #redirect back to posts index page

end




