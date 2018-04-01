class SubjectsController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to root_path
    end
  end

  def index
    @subjects = Subject.all
  end

  def create
    @subject = Subject.new(subject_params)
    unless @subject.save
      flash[:error] = "Błąd dodawania przedmiotu"
    end
    redirect_back fallback_location: root_path
  end

  def add_subject
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def destroy
    Grade.where(subject_id: params[:id]).destroy_all
    TeacherGroupSubject.where(subject_id: params[:id]).destroy_all
    Subject.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

  def delete_subject
    @subject = Subject.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private def subject_params
    params.require(:subject).permit(:subjectName)
  end
end
