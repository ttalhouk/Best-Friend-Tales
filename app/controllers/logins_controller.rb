get '/login' do
  erb :'logins/new'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'logins/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
