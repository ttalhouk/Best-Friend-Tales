# Not linked anywhere but page is built/ needs work
get '/users' do
  logged_in?
  @user = User.all

  erb :'users/index'

end

get '/users/new' do
  @errors = nil
  erb :'users/new'
end

post '/users' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    @user.images.create(name: params[:image]) if params[:image]
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end

end

get '/users/:id' do
  logged_in?
  @user = User.find(params[:id])
  erb :'users/show'

end

get '/users/:id/edit' do
  logged_in?
  #get params from url
  @user = User.find(params[:id]) #define instance variable for view
  if @user.id == current_user.id
    erb :'users/edit' #show edit user view
  else
    redirect "users/#{current_user.id}/edit"
  end

end

put '/users/:id' do

  #get params from url
  @user = User.find(params[:id]) #define variable to edit

  @user.assign_attributes(params[:user]) #assign new attributes

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users' #redirect back to user index page
  else
    erb :'users/edit' #show edit user view again(potentially displaying errors)
  end
end

delete '/users/:id' do

  #get params from url
  @user = User.find(params[:id]) #define user to delete

  @user.destroy #delete user

  redirect '/users' #redirect back to user index page

end


