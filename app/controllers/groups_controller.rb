class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all.alphabetical.includes(icon_attachment: :blob).includes(:activities)
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @assigned_activities = Activity.most_recent.includes(:group, :author).where(group_id: @group.id)
  end

  def create
    @group = Group.new(group_params)
    @group.icon.attach(params[:group][:icon])
    @group.save

    if @group.save
      flash[:notice] = 'The group was created successfully.'
      redirect_to root_path
    else
      flash[:alert] = "Group could not be saved. #{@group.errors.full_messages.join('. ')}"
      redirect_to new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :icon)
  end
end
