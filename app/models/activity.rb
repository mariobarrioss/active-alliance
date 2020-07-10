class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :group, optional: true, foreign_key: :group_id

  scope :most_recent, -> { order(created_at: :desc) }
end
