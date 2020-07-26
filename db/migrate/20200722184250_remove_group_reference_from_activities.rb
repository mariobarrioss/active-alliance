class RemoveGroupReferenceFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_reference :activities, :group, references: :groups
  end
end
