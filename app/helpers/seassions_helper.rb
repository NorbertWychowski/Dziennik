module SeassionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def loggen_in?
    !current_user.nil?
  end

  def log_out
    session.delete_lesson(:user_id)
    @current_user = nil
  end
end
