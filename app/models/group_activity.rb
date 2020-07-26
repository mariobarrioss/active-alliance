class GroupActivity < ApplicationRecord
  validates_presence_of :group_id, :activity_id
  validates :activity_id, uniqueness: { scope: :group_id }

  belongs_to :group
  belongs_to :activity

  def exists?(group, activity)
    !find_by_group_id_and_activity_id(group, activity).nil?
  end
end
