module ActivitiesHelper
  def assigned_group?(activity)
    if activity.groups.any?
      image_tag activity.groups.first.display_icon
    else
      gravatar_image_tag(activity.author.name, size: 64, alt: activity.author.email)
    end
  end

  def groups_link?(activity)
    return if activity.groups.none?

    link_to('Assigned Groups', controller: 'group_activities', action: 'index', id: activity.id)
  end

  def group_assign_link?(user, activity)
    return if user != activity.author

    link_to('Assign activity to a group', controller: 'group_activities', action: 'new', id: activity.id)
  end
end
