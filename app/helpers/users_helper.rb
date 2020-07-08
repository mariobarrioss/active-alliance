module UsersHelper
  def activities?(activities)
    return if activities.empty?

    render activities
  end
end
