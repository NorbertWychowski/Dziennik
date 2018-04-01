class StudentsController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil? or (current_user.id != params[:id].to_i and current_user.user_type_id == 3)
      redirect_to '/err/403'
    end
  end

  def show_grades
    @student = Student.find_by(user: params[:id])
    @subjects = TeacherGroupSubject.all.where(group: @student.group)
  end

  def show_notes
    @student = Student.find_by(user: params[:id])
    @notes = Note.all.where(student: @student.id)
  end

  def show
    @student = Student.find_by(user: params[:id])
    @subjects = TeacherGroupSubject.all.where(group: @student.group)
    @notes = Note.all.where(student: @student.id)
  end

  def change_group
    @student = Student.find_by(user_id: params[:id])
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def update
    Student.find(params[:id]).update(student_params)
    redirect_back fallback_location: root_path
  end

  def destroy
  end

  private def student_params
    params.require(:student).permit(:firstName, :lastName, :phone, :email, :login, :password, :group_id)
  end
end

