class AddUserReferenceToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :user, references: :users
    add_foreign_key :groups, :users, column: :user_id
  end
end
