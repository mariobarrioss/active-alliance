class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(activity_id: params[:activity_id])
    redirect_back
    flash[:notice] = 'Great! keep encouraging health :)'
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, activity_id: params[:activity_id])
    like.destroy
    redirect_back
    flash[:notice] = ':( Always encourage other if possible!'
  end
end
