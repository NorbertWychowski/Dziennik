class UsersController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to '/err/403'
    else
      unless params[:id].to_i == current_user.id or current_user.user_type_id == 1
        redirect_to '/err/403'
      end
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def user_groups
    @user = User.find(params[:id])
    @teacher_group_subject = TeacherGroupSubject.find(params[:teacher_group_subject])
  end
end
