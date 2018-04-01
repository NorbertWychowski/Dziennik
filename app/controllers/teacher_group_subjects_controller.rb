class TeacherGroupSubjectsController < ApplicationController
  def delete_lesson
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def destroy
    TeacherGroupSubject.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

  def add_lesson
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def create
    @lesson = TeacherGroupSubject.new(lesson_params)
    if @lesson.save
      redirect_back fallback_location: root_path
    end
  end

  private def lesson_params
    params.require(:teacher_group_subject).permit(:user_id, :subject_id, :group_id)
  end
end