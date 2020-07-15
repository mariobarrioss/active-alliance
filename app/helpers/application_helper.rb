module ApplicationHelper
  def notification?(notification)
    return if notification.nil?

    if notification == notice
      content_tag(:div, class: 'notification is-success is-light mb-0') do
        concat(content_tag(:button, '', class: 'delete'))
        concat(content_tag(:p, notification))
      end
    else
      content_tag(:div, class: 'notification is-danger is-light mb-0') do
        concat(content_tag(:button, '', class: 'delete'))
        concat(content_tag(:p, notification))
      end
    end
  end

  def like_or_dislike(activity)
    like = Like.find_by(activity: activity, user: current_user)
    if like
      link_to('Dislike!', activity_like_path(id: like.id, activity_id: activity.id), class: 'has-text-grey',
                                                                                     method: :delete)
    else
      link_to('Like!', activity_likes_path(activity_id: activity.id), class: 'has-text-grey', method: :post)
    end
  end

  def like_or_dislike_icon(activity)
    like = Like.find_by(activity: activity, user: current_user)
    if like
      content_tag(:span, content_tag(:i, '', class: 'fas fa-heart'), class: 'icon is-small has-text-danger')
    else
      content_tag(:span, content_tag(:i, '', class: 'fas fa-heart'), class: 'icon is-small has-text-grey')
    end
  end
end
