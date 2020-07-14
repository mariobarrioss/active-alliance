class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show edit update destroy]

  def new
    @activity = Activity.new
  end

  def show; end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      flash[:notice] = 'A new activity was added to all your activities'
      redirect_to @activity
    else
      flash[:alert] = "Activity could not be saved. #{@activity.errors.full_messages.join('. ')}"
      redirect_to new_activity_path
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:description, :amount, :group_id)
  end
end
