module GroupsHelper
  def assigned_activities?(activities)
    return if activities.nil?
 
    render activities
  end
end
