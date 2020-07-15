class LikesController < ApplicationController
  def create
    like = current_user.likes.create(activity_id: params[:activity_id])
    like.save

    if like.save
      flash[:notice] = 'Great! keep encouraging healthy activities'
    else
      flash[:alert] = 'You cannot like this post'
    end
    redirect_to request.referrer
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, activity_id: params[:activity_id])
    like.destroy

    flash[:alert] = if like.destroy
                      'You disliked an activity'
                    else
                      'You cannot dislike a post that was not previously liked!'
                    end

    redirect_to request.referrer
  end
end
