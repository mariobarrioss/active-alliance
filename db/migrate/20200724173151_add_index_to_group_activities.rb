class AddIndexToGroupActivities < ActiveRecord::Migration[5.2]
  def change
    add_index :group_activities, [:group_id, :activity_id], unique: true
  end
end
