class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
	end

	def new
	end

	def create
		@group = Group.new(group_params)

		@group.save

		redirect_to @group
	end

	private def group_params
		params.require(:group).permit(:year, :groupID)
	end
end
