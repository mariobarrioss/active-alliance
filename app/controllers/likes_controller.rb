class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(activity_id: params[:activity_id])
    @like.save
    redirect_to request.referrer
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, activity_id: params[:activity_id])
    like.destroy
    redirect_to request.referrer
  end
end
