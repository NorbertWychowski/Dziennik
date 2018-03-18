class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def user_groups
    @user = User.find(params[:id])
    @teacher_group_subject = TeacherGroupSubject.find(params[:teacher_group_subject])
  end
end
