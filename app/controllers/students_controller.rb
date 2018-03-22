class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(user: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    redirect_to root_path
  end

  def destroy
  end

  private def student_params
    params.require(:student).permit(:firstName, :lastName, :phone, :email, :login, :password, :group_id)
  end
end
