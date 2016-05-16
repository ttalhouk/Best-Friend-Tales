get '/users' do

  @user = User.all #define instance variable for view

  erb :'users/index' #show all user view (index)

end

get '/users/new' do

  erb :'users/new' #show new user view

end

get '/users/new' do
  @errors = nil
  erb :'users/new' #show new user view

end

post '/users' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    if params[:image]
      @user.images.create(name: params[image])
    end
    redirect '/users/' #redirect back to user index page
  else
    @errors = @user.errors.full_messages
    erb :'users/new' # show new user view again(potentially displaying errors)
  end

end

get '/users/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view

  erb :'users/show' #show single user view

end

get '/users/:id/edit' do

  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view

  erb :'user/edit' #show edit user view

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


