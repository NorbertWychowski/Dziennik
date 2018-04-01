class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password_digest])
      log_in(user)
      redirect_to root_path
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
