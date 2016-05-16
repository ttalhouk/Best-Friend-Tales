helpers do
  def logged_in?
    redirect '/users/new' unless session[:user_id]
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      false
    end
  end
end
