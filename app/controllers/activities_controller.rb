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

  def edit; end

  def update
    if @activity.update(activity_params)
      flash[:notice] = 'Your activity was updated successfully'
    else
      flash[:alert] = "Activity could not be updated. #{@activity.errors.full_messages.join('. ')}"
    end
    redirect_to @activity
  end

  def destroy
    if @activity.destroy
      flash[:notice] = 'Your activity was deleted successfully'
      redirect_to root_path
    else
      flash[:alert] = "You can't delete this activity. #{@activity.errors.full_messages.join('. ')}"
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:description, :amount)
  end
end
