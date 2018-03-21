class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password_digest])
      log_in(user)
      case user.user_type_id
        when 1
          redirect_to root_path
        when 2
          redirect_to user_url(user)
        when 3
          redirect_to student_url(user)
        else
          flash.now[:danger] = user.user_type_id + " kim jestes?"
          render 'login'
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
