get '/user' do

  @user = User.all #define instance variable for view

  erb :'user/index' #show all user view (index)

end

get '/user/new' do

  erb :'user/new' #show new user view

end

get '/user/new' do

  erb :'user/new' #show new user view

end

post '/user' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/user' #redirect back to user index page
  else
    erb :'user/new' # show new user view again(potentially displaying errors)
  end

end

get '/user/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view

  erb :'user/show' #show single user view

end

get '/user/:id/edit' do

  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view

  erb :'user/edit' #show edit user view

end

put '/user/:id' do

  #get params from url
  @user = User.find(params[:id]) #define variable to edit

  @user.assign_attributes(params[:user]) #assign new attributes

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/user' #redirect back to user index page
  else
    erb :'user/edit' #show edit user view again(potentially displaying errors)
  end

end

delete '/user/:id' do

  #get params from url
  @user = User.find(params[:id]) #define user to delete

  @user.destroy #delete user

  redirect '/user' #redirect back to user index page

end


