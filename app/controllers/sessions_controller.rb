class SessionsController < ApplicationController
  def self.sweep(time = 1.hour)
    if time.is_a?(String)
      time = time.split.inject {|count, unit| count.to_i.send(unit)}
    end

    delete_all "zaktualizowano o '#{time.ago.to_s(:db)}'"
  end

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
