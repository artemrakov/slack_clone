module AuthManagment
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
    session.clear
  end

  def signed_in?
    !current_user.guest?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || Guest.new
  end

  def authenticate_user!
    return if signed_in?

    redirect_to root_path
  end

  def redirect_logged_in!
    return unless signed_in?

    redirect_to root_path
  end
end
