module ActivitiesHelper
  def assigned_group?(activity)
    if activity.group.nil?
      gravatar_image_tag(activity.author.name, size: 128, alt: activity.author.email)
    else
      image_tag activity.group.display_icon
    end
  end

  def group_name?(activity)
    return if activity.group.nil?

    content_tag(:p, content_tag(:small, activity.group.name), class: ' is-size-7')
  end
end
