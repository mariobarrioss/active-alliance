class Activity < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 480 }

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :group, optional: true, foreign_key: :group_id
  has_many :likes, dependent: :destroy

  scope :most_recent, -> { order(created_at: :desc) }
end
