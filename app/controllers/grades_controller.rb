class GradesController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to root_path
    else
      if current_user.user_type_id == 3
        redirect_to '/403'
      end
    end
  end

  def create
    @grade = Grade.new(grade_params)
    unless @grade.save
      flash[:error] = "Błąd dodawania oceny"
    end
    redirect_back fallback_location: root_path
  end

  def add_grade
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def edit_grades
    @student = Student.find(params[:student_id])
    @subject = Subject.find(params[:subject_id])
    @grades = Grade.all.where(student_id: @student.id, subject_id: @subject.id)
  end

  def edit_grade
    @grade = Grade.find(params[:grade_id])
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def update
    Grade.find(params[:id]).update(grade_params)
    redirect_back fallback_location: root_path
  end

  def delete_grade
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_back fallback_location: root_path
  end

  private def grade_params
    params.require(:grade).permit(:grade, :info, :obtained_date, :subject_id, :student_id, :user_id)
  end
end