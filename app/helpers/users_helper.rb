module UsersHelper
  def activities?(activities)
    return if activities.nil?

    render activities
  end
end
