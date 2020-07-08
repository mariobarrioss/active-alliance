class Group < ApplicationRecord
  # has_many :activities, -> { where(group_id: id) }
  has_many :activities
  has_one_attached :icon

  validates :icon, content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: 'must be a valid image format' },
                   size: { less_than: 5.megabytes,
                           message: 'should be less than 5MB' }

  def display_icon
    icon.variant(resize: '400x400')
  end

  def assigned_activities
    Activity.where(group_id: id)
  end
end
