class NotesController < ApplicationController
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
    @note = Note.new(note_params)
    unless @note.save
      flash[:error] = "Błąd"
    end
    redirect_back fallback_location: root_path
  end

  def add_note
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def delete_note
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_back fallback_location: root_path
  end

  private def note_params
    params.require(:note).permit(:description, :user_id, :student_id, :note_type_id, :obtained_date)
  end
end
