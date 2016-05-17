get '/posts' do

  @posts = Post.all #define instance variable for view

  erb :'posts/index' #show all posts view (index)

end

get '/users/:id/posts/new' do

  erb :'posts/new' #show new posts view

end

post '/user/:id/posts' do

  #below works with properly formatted params in HTML form
  @post = Post.new(params[:post]) #create new post

  if @post.save #saves new post or returns false if unsuccessful
    @post.images.create(name: params[:image]) if params[:image]
    redirect '/posts' #redirect back to posts index page
  else
    erb :'posts/new' # show new posts view again(potentially displaying errors)
  end

end


get '/users/:id/posts/:id' do

  #gets params from url

  @post = Post.find(params[:id]) #define instance variable for view

  erb :'posts/show' #show single post view

end

get '/posts/:id/edit' do

  #get params from url
  @post = Post.find(params[:id]) #define intstance variable for view

  erb :'posts/edit' #show edit post view

end

put '/posts/:id' do

  #get params from url
  @post = Post.find(params[:id]) #define variable to edit

  @post.assign_attributes(params[:post]) #assign new attributes

  if @post.save #saves new post or returns false if unsuccessful
    redirect '/posts' #redirect back to posts index page
  else
    erb :'posts/edit' #show edit post view again(potentially displaying errors)
  end

end

delete '/posts/:id' do

  #get params from url
  @post = Post.find(params[:id]) #define post to delete

  @post.destroy #delete post

  redirect '/posts' #redirect back to posts index page

end




