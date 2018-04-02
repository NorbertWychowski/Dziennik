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
    @subjects = TeacherGroupSubject.where(user_id: params[:id])
  end

  def index
    @users = User.joins("LEFT JOIN teacher_group_subjects t ON users.id = t.user_id")
                 .select("users.*, COUNT(t.id) as s_count").where.not(user_type_id: 3).group("id").order("id")
  end

  def create
    @user = User.new(first_name: user_params[:first_name], last_name: user_params[:last_name], phone: user_params[:phone],
                     email: user_params[:email], login: user_params[:login], password_digest: user_params[:password_digest],
                     address: user_params[:address], birth_date: user_params[:birth_date],
                     user_type_id: user_params[:user_type_id])
    @user.password_digest = BCrypt::Password.create(@user.password_digest)
    @user.save
    if user_params[:user_type_id].to_i == 3
      @maxNR = Student.where(group_id: user_params[:students_attributes][:group_id]).maximum("nr").to_i + 1
      @student = Student.new(nr: @maxNR, group_id: user_params[:students_attributes][:group_id], user_id: @user.id)
      @student.save
    end
    puts user_params[:group_id]
    redirect_to root_path
  end

  def new
    unless current_user.user_type_id == 1
      redirect_to '/err/403'
    end
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
    @students = Student.joins(:group).joins(:user).select("students.*, users.first_name, users.last_name")
                    .where(group: @group.group).order(:nr)
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :login, :password_digest,
                                 :address, :birth_date, :user_type_id, students_attributes: [:group_id])
  end
end
