class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'The group was created successfully.' }
        # format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
