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

  def edit_activity_link?(user, activity)
    return if user != activity.author

    link_to(edit_activity_path(id: activity.id)) do
      content_tag(:span, content_tag(:i, '', class: 'far fa-edit'), class: 'icon is-small has-text-grey')
    end
  end

  def delete_activity_link?(user, activity)
    return if user != activity.author

    link_to(activity_path(id: activity.id), method: :delete) do
      content_tag(:span, content_tag(:i, '', class: 'far fa-trash-alt'), class: 'icon is-small has-text-danger')
    end
  end
end
