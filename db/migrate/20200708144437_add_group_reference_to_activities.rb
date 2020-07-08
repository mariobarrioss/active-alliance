class AddGroupReferenceToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :group, references: :groups
    add_foreign_key :activities, :groups, column: :group_id
  end
end
