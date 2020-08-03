class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all.alphabetical.includes(icon_attachment: :blob).includes(:group_activities, :activities, :user)
  end

  def new
    @group = Group.new
  end

  def show
    @assigned_activities = @group.activities.most_recent.includes(:author, groups: [icon_attachment: :blob])
  end

  def create
    @group = current_user.groups.build(group_params)
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

  def edit; end

  def update
    if @group.update(group_params)
      flash[:notice] = 'Your group was updated successfully'
    else
      flash[:alert] = "Activity could not be updated. #{@group.errors.full_messages.join('. ')}"
    end
    redirect_to @group
  end

  def destroy
    if @group.destroy
      flash[:notice] = 'Your group was deleted successfully'
      redirect_to root_path
    else
      flash[:alert] = "You can't delete this group. #{@group.errors.full_messages.join('. ')}"
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :icon)
  end
end
