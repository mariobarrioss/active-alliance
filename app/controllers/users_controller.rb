class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_activities, only: %i[personal external]

  def show; end

  def personal; end

  def external; end

  private

  def set_user
    @user = current_user
  end

  def set_activities
    @personal_activities = Activity.most_recent.includes(:author).where(author_id:
      @user.id)
    @external_activities = @personal_activities.select { |activity| activity.group_activities.count.zero? }
  end
end
