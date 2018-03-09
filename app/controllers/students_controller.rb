class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		@group = Group.find(params[:group_id])
		@student = @group.students.create(student_params)

		redirect_to group_path(@group)
	end

	def destroy
	end

	private def student_params
		params.require(:student).permit(:firstName, :lastName)
	end
end
