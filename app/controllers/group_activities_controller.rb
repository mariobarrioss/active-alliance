class GroupActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[new index]

  def index
    @groups = @activity.groups.alphabetical.includes(:user, :activities, :group_activities, icon_attachment: [:blob])
  end

  def new
    @groups = Group.all.alphabetical.includes(icon_attachment: :blob).includes(:group_activities, :activities, :user)
    @grouped_activity = GroupActivity.new
  end

  def create
    @grouped_activity = GroupActivity.new(group_activity_params)

    if @grouped_activity.save
      flash[:notice] = 'Assignment was successfull'
    else
      flash[:alert] = "Already assigned to this group. #{@grouped_activity.errors.full_messages.join('. ')}"
    end
    redirect_to root_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def group_activity_params
    params.require(:group_activity).permit(:group_id, :activity_id)
  end
end
