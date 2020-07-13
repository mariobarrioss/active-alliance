class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all.alphabetical.includes(icon_attachment: :blob)
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

    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'The group was created successfully.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :icon)
  end
end
