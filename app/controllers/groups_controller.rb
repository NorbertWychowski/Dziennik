class GroupsController < ApplicationController
  before_action :requires_permission

  private def requires_permission
    if current_user.nil?
      redirect_to root_path
    end
  end

  def index
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    unless @group.save
      flash[:error] = "Błąd dodawania grupy"
    end
    redirect_back fallback_location: root_path
  end

  def add_group
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private def group_params
    params.require(:group).permit(:groupName)
  end
end
