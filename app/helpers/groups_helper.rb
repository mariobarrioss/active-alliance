module GroupsHelper
  def assigned_activities?(activities)
    return if activities.empty?
    
    render activities
  end
end
