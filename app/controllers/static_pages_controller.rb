class StaticPagesController < ApplicationController
  before_action :requires_login

  private def requires_login
    if current_user.nil?
      redirect_to login_path
    end
  end

  def home
  end
end
