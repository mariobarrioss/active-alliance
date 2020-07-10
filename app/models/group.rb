class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 75 }
  validates :icon, presence: true,
                   content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: 'must be a valid image format' },
                   size: { less_than: 5.megabytes,
                           message: 'should be less than 5MB' }

  has_many :activities
  has_one_attached :icon

  scope :alphabetical, -> { order(:name) }

  def display_icon
    icon.variant(resize: '400x400')
  end

  def assigned_activities
    Activity.most_recent.where(group_id: id)
  end
end
