class AddAuthorReferenceToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :author, references: :users
    add_foreign_key :activities, :users, column: :author_id
  end
end
