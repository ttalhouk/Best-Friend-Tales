helpers do
  def logged_in?
    redirect '/users/new' unless session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
