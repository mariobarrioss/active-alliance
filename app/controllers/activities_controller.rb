class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show edit update destroy]

  def new
    @activity = Activity.new
  end

  def show; end

  def create
    @activity = current_user.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'A new activity was added to all your activities.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
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
