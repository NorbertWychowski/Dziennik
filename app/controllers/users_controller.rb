class UsersController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to root_path
    else
      unless params[:id].to_i == current_user.id or current_user.user_type_id != 3
        redirect_to '/err/403'
      end
    end
  end

  def profile
    unless @user = User.where(id: params[:id]).first
      redirect_to '/err/404'
    end
  end

  def show
    unless @user = User.where(id: params[:id]).first
      redirect_to '/err/404'
    end
    @subjects = TeacherGroupSubject.joins(:subject).joins(:group).where(user_id: params[:id]).select("*")
  end

  def index
    @users = User.joins("LEFT JOIN teacher_group_subjects t ON users.id = t.user_id")
                 .select("users.*, COUNT(t.id) as s_count").where.not(user_type_id: 3).group("id").order("id")
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
    unless current_user.user_type_id == 1
      redirect_to '/err/403'
    end
    @user = User.new
    @user.students.build
  end

  def update
  end

  def edit_user
  end

  def user_groups
    unless @user = User.where(id: params[:id]).first
      redirect_to '/err/404'
    end
    @group = TeacherGroupSubject.find(params[:teacher_group_subject])
    @subject = @group.subject
    @students = Student.joins(:group).joins(:user).select("*").where(group: @group)
  end

  private def user_params
    params.require(:user).permit(:firstName, :lastName, :phone, :email, :email, :login, :password_digest,
                                 :address, :birth_date, :user_type_id, students_attributes: [:group_id])
  end
end
