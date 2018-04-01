class UsersController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to root_path
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

  def index
    @users = User.where.not(user_type_id: 3).all
  end

  def create
    @user = User.new(user_params)
    @user.save
    if params[:user_type_id] == 3
      @student = Student.new(user_id: @user.id, group_id: params[:group_id])
      @student.save
    end
    redirect_to root_path
  end

  def new
    @user = User.new
    @user.students.build
  end

  def update
  end

  def edit_user
  end

  def user_groups
    @user = User.find(params[:id])
    @teacher_group_subject = TeacherGroupSubject.find(params[:teacher_group_subject])
  end

  private def user_params
    params.require(:user).permit(:firstName, :lastName, :phone, :email, :email, :login, :password_digest,
                                 :address, :birth_date, :user_type_id, students_attributes: [:group_id])
  end
end
