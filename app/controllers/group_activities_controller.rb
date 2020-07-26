class GroupActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[new show]

  def new
    @groups = Group.all.alphabetical.includes(icon_attachment: :blob)
    @grouped_activity = GroupActivity.new
  end

  def show; end

  def create
    @grouped_activity = GroupActivity.new(group_activity_params)

    if @grouped_activity.save
      flash[:notice] = 'Assigment was successfull'
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
