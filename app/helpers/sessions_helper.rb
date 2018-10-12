module SessionsHelper
  # login by using user who was sent
  def log_in(user)
    session[:user_id] = user.id
  end

  # return user who is loggin in now (if there is)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # return true if user logins, else return false
  def logged_in?
    !current_user.nil?
  end

  # logout
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
