class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end

  def personal
    @personal_activities = @user.personal_activities
  end

  def external
    @external_activities = @user.external_activities
  end

  private

  def set_user
    @user = current_user
  end
end
