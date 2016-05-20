helpers do
  def logged_in?
    redirect '/login' unless session[:user_id]
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      false
    end
  end

  def is_current_user?(user)
    current_user.id === user.id
  end

  def any_errors(user)
    error = user.errors.full_messages
    error == [] ? nil : error
  end
end
