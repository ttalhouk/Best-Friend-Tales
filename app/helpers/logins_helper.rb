helpers do
  def logged_in?
    redirect '/users/new' unless session[:user_id]
  end
end
