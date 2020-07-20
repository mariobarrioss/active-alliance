module ApplicationHelper
  def nav_links(user_authenticated)
    if user_authenticated
      render 'shared/signed_user_links'
    else
      render 'shared/unsigned_user_links'
    end
  end

  def notification?(notification)
    return if notification.nil?

    if notification == notice
      render 'shared/notice'
    else
      render 'shared/alert'
    end
  end

  def like(activity)
    like = Like.find_by(activity: activity, user: current_user)
    if like
      link_to(activity_like_path(id: like.id, activity_id: activity.id), class: 'level-item', method: :delete) do
        content_tag(:span, content_tag(:i, '', class: 'fas fa-heart'), class: 'icon is-small has-text-danger')
      end
    else
      link_to(activity_likes_path(activity_id: activity.id), class: 'level-item', method: :post) do
        content_tag(:span, content_tag(:i, '', class: 'fas fa-heart'), class: 'icon is-small has-text-grey')
      end
    end
  end

  def total(activities)
    return 0 if activities.nil?

    activities.sum(&:amount)
  end
end
