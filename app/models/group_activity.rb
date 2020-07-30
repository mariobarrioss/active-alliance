class GroupActivity < ApplicationRecord
  validates_presence_of :group_id, :activity_id
  validates :activity_id, uniqueness: { scope: :group_id }

  belongs_to :group
  belongs_to :activity

  def self.assigned_activities(group)
    where(group_id: group)
  end

  def self.assigned_groups(activity)
    where(activity_id: activity)
  end
end
