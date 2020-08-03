module GroupsHelper
  def assigned_activities?(activities)
    return if activities.nil?

    render activities
  end

  def edit_group_link?(user, group)
    return if user != group.user

    link_to(edit_group_path(id: group.id)) do
      content_tag(:span, content_tag(:i, '', class: 'far fa-edit'), class: 'icon is-medium has-text-grey')
    end
  end

  def delete_group_link?(user, group)
    return if user != group.user

    link_to(group_path(id: group.id), method: :delete) do
      content_tag(:span, content_tag(:i, '', class: 'far fa-trash-alt'), class: 'icon is-medium has-text-danger')
    end
  end
end
