# Not linked anywhere but page is built/ needs work
get '/users' do
  logged_in?
  @users = User.all.shuffle
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
  @user = User.find(params[:id])
  if is_current_user?(@user)
    @errors = any_errors(@user)
    erb :'users/edit'
  else
    redirect "users/#{current_user.id}/edit"
  end

end

put '/users/:id' do

  @user = User.find(params[:id])
  @image = @user.images.last.update(name: params[:image])
  p params[:user]
  @user.assign_attributes(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = any_errors(@user)
    erb :'users/edit'
  end
end



