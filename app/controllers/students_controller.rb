class StudentsController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil? or (current_user.id != params[:id].to_i and current_user.user_type_id == 3)
      redirect_to '/err/403'
    end
  end

  def index
    @students = Student.joins(:user).joins(:group).select("*")
  end

  def show_grades
    unless @student = Student.where(user_id: params[:id]).first
      redirect_to '/err/404'
    end
    @subjects = TeacherGroupSubject.joins(:subject).where(group_id: @student.group_id).select("*").uniq
  end

  def show_notes
    unless @student_id = Student.where(user_id: params[:id]).first
      redirect_to '/err/404'
    end
    @notes = Note.joins(:user).select("*").where(student_id: @student_id.id)
  end

  def show
    unless @student = Student.where(user_id: params[:id]).first
      redirect_to '/err/404'
    end
    @subjects = TeacherGroupSubject.joins(:subject).where(group_id: @student.group_id).select("*").uniq
    @notes = Note.joins(:user).where(student_id: @student.id).select("*")
  end

  def change_group
    unless @student = Student.where(user_id: params[:id]).first
      redirect_to '/err/404'
    end
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def update
    unless @student = Student.where(id: params[:id]).first
      redirect_to '/err/404'
    end
    if @student.group.id != student_params[:group_id]
      @student.nr = Student.where(group_id: @student.group_id).maximum("nr") + 1
    end
    @student.update(student_params)
    redirect_back fallback_location: root_path
  end

  def delete_student
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def destroy
    @student = Student.where(user_id: params[:id]).first
    Grade.where(student: @student).destroy_all
    Note.where(student: @student).destroy_all
    @student.destroy
    User.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

  private def student_params
    params.require(:student).permit(:login, :password, :group_id)
  end
end

