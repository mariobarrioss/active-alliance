module UsersHelper
  def activities?(activities)
    return if activities.nil?

    render activities
  end

  def total(activities)
    return 0 if activities.nil?

    activities.sum(&:amount)
  end
end
