module ActivitiesHelper
  def assigned_group?(activity)
    gravatar_image_tag(activity.author.name, size: 64, alt: activity.author.email)
  end

  def group_name?(activity)
    return if activity.group.nil?

    content_tag(:p, content_tag(:small, activity.group.name), class: ' is-size-7')
  end
end
