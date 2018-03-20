class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password_digest])
      log_in(user)
      if user.user_type_id == 3
        redirect_to student_url(user)
      elsif user.user_type_id == 2
        redirect_to user_url(user)
      else
        redirect_to root
      end
    else
      flash.now[:danger] = "Podano nieprawidłowe hasło lub nazwę użytkownika"
      render :action => 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
