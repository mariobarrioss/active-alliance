module ActivitiesHelper
  def assigned_group?(activity)
    if activity.groups.any?
      image_tag activity.groups.first.display_icon
    else
      gravatar_image_tag(activity.author.name, size: 64, alt: activity.author.email)
    end
  end

  def group_name?(activity)
    return if activity.group.nil?

    content_tag(:p, content_tag(:small, activity.group.name), class: ' is-size-7')
  end
end
