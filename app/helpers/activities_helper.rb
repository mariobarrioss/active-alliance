module ActivitiesHelper
  def assigned_group?(activity)
    if activity.group.nil?
      gravatar_image_tag(activity.author.name, size: 128, alt: activity.author.email)
    else
      image_tag activity.group.display_icon
    end
  end
end
